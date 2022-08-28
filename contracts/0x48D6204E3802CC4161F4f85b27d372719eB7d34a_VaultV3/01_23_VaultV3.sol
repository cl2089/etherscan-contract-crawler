// SPDX-License-Identifier: CC-BY-NC-4.0
// Copyright (Ⓒ) 2022 Deathwing (https://github.com/Deathwing). All rights reserved
pragma solidity 0.8.16;

import "./interfaces/lightweight/IERC20.sol";
import "./interfaces/IFeeCollectorV2.sol";
import "./interfaces/ISignerVaultV3.sol";
import "./interfaces/ISignerVaultFactoryV1.sol";
import "./interfaces/IVaultV2.sol";
import "./library/TransferHelper.sol";
import "./library/TransferHelperV2.sol";

contract VaultV3 is IVaultV2 {
  uint constant private UINT_MAX_VALUE = 2 ** 256 - 1;
  string constant private IDENTIFIER = "Vault";
  uint constant private VERSION = 3;

  address private immutable _deployer;
  Dependency[] _dependencies;

  address private _signerVaultFactory;
  address private _feeCollector;

  bool private _locked;

  constructor() {
    _deployer = msg.sender;
    _dependencies.push(Dependency("SignerVaultFactory", 1));
    _dependencies.push(Dependency("FeeCollector", 2));
  }

  receive() external payable { TransferHelper.safeTransferETH(_feeCollector, msg.value); }
  fallback() external payable { TransferHelper.safeTransferETH(_feeCollector, msg.value); }

  modifier lock() {
    require(!_locked, "Vault: reentrancy");
    _locked = true;
    _;
    _locked = false;
  }

  modifier onlyDeployer() {
    require(msg.sender == _deployer, "Vault: caller must be the deployer");
    _;
  }

  function ensureVault(address vault) private view {
    require(ISignerVaultFactoryV1(_signerVaultFactory).contains(vault), "Vault: unknown vault");
    require(ISignerVaultV3(vault).signer(msg.sender), "Vault: caller must be a signer of the vault");
  }

  function ensureVaultOnly(address vault) private view {
    require(ISignerVaultFactoryV1(_signerVaultFactory).contains(vault), "Vault: unknown vault");
  }

  function ensureFee(uint fee) private {
    require(msg.value >= fee, "Vault: insufficient value");
    if (fee > 0)
      IFeeCollectorV2(_feeCollector).payFee{ value: fee }(fee);
    if (msg.value > fee) 
      TransferHelper.safeTransferETH(msg.sender, msg.value - fee);
  }

  function ensureFeeOnPartner(uint fee, address partner) private {
    require(msg.value >= fee, "Vault: insufficient value");
    if (fee > 0)
      IFeeCollectorV2(_feeCollector).payFeeOnPartner{ value: fee }(fee, partner);
    if (msg.value > fee) 
      TransferHelper.safeTransferETH(msg.sender, msg.value - fee);
  }

  function ensureAmountAndFee(uint amount, uint fee) private {
    require(msg.value >= amount + fee, "Vault: insufficient value");
    if (fee > 0)
      IFeeCollectorV2(_feeCollector).payFee{ value: fee }(fee);
    if (msg.value > amount + fee) 
      TransferHelper.safeTransferETH(msg.sender, msg.value - amount - fee);
  }

  function ensureAmountAndFeeOnPartner(uint amount, uint fee, address partner) private {
    require(msg.value >= amount + fee, "Vault: insufficient value");
    if (fee > 0)
      IFeeCollectorV2(_feeCollector).payFeeOnPartner{ value: fee }(fee, partner);
    if (msg.value > amount + fee) 
      TransferHelper.safeTransferETH(msg.sender, msg.value - amount - fee);
  }

  function identifier() external pure returns (string memory) {
    return IDENTIFIER;
  }

  function version() external pure returns (uint) {
    return VERSION;
  }

  function dependencies() external view returns (Dependency[] memory) {
    return _dependencies;
  }

  function updateDependencies(Dependency[] calldata dependencies_) external onlyDeployer {
    delete _dependencies;
    for (uint index = 0; index < dependencies_.length; index++)
      _dependencies.push(dependencies_[index]);
  }

  function deployer() external view returns (address) {
    return _deployer;
  }

  function initialize(bytes calldata data) external onlyDeployer {
    address[] memory addresses = abi.decode(data, (address[]));
    address signerVaultFactory_ = addresses[0];
    address feeCollector_ = addresses[1];

    _signerVaultFactory = signerVaultFactory_;
    _feeCollector = feeCollector_;
  }

  function signerVaultFactory() external view returns (address) {
    return _signerVaultFactory;
  }

  function feeCollector() external view returns (address) {
    return _feeCollector;
  }

  function partnerOf(address partner) external view returns (uint) { return IFeeCollectorV2(_feeCollector).partnerOf(partner); }

  function fees() external view returns (Fees memory) { return IFeeCollectorV2(_feeCollector).fees(); }
  function fees(address signerVault) external view returns (Fees memory) { return IFeeCollectorV2(_feeCollector).fees(signerVault, msg.sender); }

  function vaults() external view returns (address[] memory) { return ISignerVaultFactoryV1(_signerVaultFactory).vaultsOf(msg.sender); }
  function vaultsLength() external view returns (uint) { return ISignerVaultFactoryV1(_signerVaultFactory).vaultsLengthOf(msg.sender); }
  function getVault(uint index) external view returns (address) { return ISignerVaultFactoryV1(_signerVaultFactory).getVaultOf(msg.sender, index); }

  function createVault() external lock returns (address) { return ISignerVaultFactoryV1(_signerVaultFactory).createVault(msg.sender); }

  function vote(address vault) external view returns (bytes memory data, uint quorom, uint accepts, uint rejects, bool voted) { (data, quorom, accepts, rejects, voted) = ISignerVaultV3(vault).vote(msg.sender); }
  function voteInitiator(address vault) external view returns (address) { return ISignerVaultV3(vault).voteInitiator(); }
  function castVote(address vault, bool accept) external lock { ensureVault(vault); ISignerVaultV3(vault).castVote(accept, msg.sender); }

  function addSigner(address vault, address nominee) external lock { ensureVault(vault); ISignerVaultV3(vault).addSigner(nominee, msg.sender); }
  function removeSigner(address vault, address nominee) external lock { ensureVault(vault); ISignerVaultV3(vault).removeSigner(nominee, msg.sender); }

  function lockMapMultiple(MultiVaultsLockMapsOperation[] calldata operations) external view returns (LockMap[][] memory) { LockMap[][] memory lockMaps = new LockMap[][](operations.length); for (uint index = 0; index < operations.length; index++) { lockMaps[index] = ISignerVaultV3(operations[index].vault).lockMapMultiple(operations[index].ids); } return lockMaps; }
  function claimMultiple(MultiVaultsClaimsAndUnlocksOperation[] calldata operations) external { for (uint index = 0; index < operations.length; index++) { ensureVault(operations[index].vault); ISignerVaultV3(operations[index].vault).claimMultiple(operations[index].currencyTypes, operations[index].ids, operations[index].values, operations[index].recipient); } }
  function unlockMultiple(MultiVaultsClaimsAndUnlocksOperation[] calldata operations) external { for (uint index = 0; index < operations.length; index++) { ensureVault(operations[index].vault); ISignerVaultV3(operations[index].vault).unlockMultiple(operations[index].currencyTypes, operations[index].ids, operations[index].values, operations[index].recipient, msg.sender); } }
  function lockMultiple(MultiVaultsLocksOperation[] calldata operations) external payable {for (uint index = 0; index < operations.length; index++) {  _lockMultiple(operations[index].vault, operations[index].currencyTypes, operations[index].ids, operations[index].values, operations[index].untils, false, address(0)); } }
  function lockMultipleOnPartner(MultiVaultsLocksOperation[] calldata operations, address partner) external payable { for (uint index = 0; index < operations.length; index++) { _lockMultiple(operations[index].vault, operations[index].currencyTypes, operations[index].ids, operations[index].values, operations[index].untils, true, partner); } }

  function lockMapETH(address vault) external view returns (LockMap memory) { return ISignerVaultV3(vault).lockMapETH(); }
  function claimETH(address vault) external lock { ensureVault(vault); ISignerVaultV3(vault).claimETH(msg.sender); }
  function claimETH(address vault, address recipient) external lock { ensureVault(vault); ISignerVaultV3(vault).claimETH(recipient); }
  function unlockETH(address vault, uint amount) external lock { ensureVault(vault); ISignerVaultV3(vault).unlockETH(amount, msg.sender, msg.sender); }
  function unlockETH(address vault, uint amount, address recipient) external lock { ensureVault(vault); ISignerVaultV3(vault).unlockETH(amount, recipient, msg.sender); }
  function lockETH(address vault, uint amount, uint until) external payable { _lockETH(vault, amount, until, false, address(0)); }
  function lockETHOnPartner(address vault, uint amount, uint until, address partner) external payable { _lockETH(vault, amount, until, true, partner); }
  function lockETHPermanently(address vault, uint amount) external payable { _lockETH(vault, amount, UINT_MAX_VALUE, false, address(0)); }
  function lockETHPermanentlyOnPartner(address vault, uint amount, address partner) external payable { _lockETH(vault, amount, UINT_MAX_VALUE, true, partner); }

  function lockMapToken(address vault, address token) external view returns (LockMap memory) { return ISignerVaultV3(vault).lockMapToken(token); }
  function claimToken(address vault, address token) external lock { ensureVault(vault); ISignerVaultV3(vault).claimToken(token, msg.sender); }
  function claimToken(address vault, address token, address recipient) external lock { ensureVault(vault); ISignerVaultV3(vault).claimToken(token, recipient); }
  function unlockToken(address vault, address token, uint amount) external lock { ensureVault(vault); ISignerVaultV3(vault).unlockToken(token, amount, msg.sender, msg.sender); }
  function unlockToken(address vault, address token, uint amount, address recipient) external lock { ensureVault(vault); ISignerVaultV3(vault).unlockToken(token, amount, recipient, msg.sender); }
  function lockToken(address vault, address token, uint amount, uint until) external payable { _lockToken(vault, token, amount, until, false, address(0)); }
  function lockTokenOnPartner(address vault, address token, uint amount, uint until, address partner) external payable { _lockToken(vault, token, amount, until, true, partner); }
  function lockTokenPermanently(address vault, address token, uint amount) external payable { _lockToken(vault, token, amount, UINT_MAX_VALUE, false, address(0)); }
  function lockTokenPermanentlyOnPartner(address vault, address token, uint amount, address partner) external payable { _lockToken(vault, token, amount, UINT_MAX_VALUE, true, partner); }

  function lockMapERC721(address vault, address erc721) external view returns (LockMap memory) { return ISignerVaultV3(vault).lockMapERC721(erc721); }
  function claimERC721(address vault, address erc721, uint tokenId) external lock { ensureVault(vault); ISignerVaultV3(vault).claimERC721(erc721, tokenId, msg.sender); }
  function claimERC721(address vault, address erc721, uint tokenId, address recipient) external lock { ensureVault(vault); ISignerVaultV3(vault).claimERC721(erc721, tokenId, recipient); }
  function unlockERC721(address vault, address erc721, uint tokenId) external lock { ensureVault(vault); ISignerVaultV3(vault).unlockERC721(erc721, tokenId, msg.sender, msg.sender); }
  function unlockERC721(address vault, address erc721, uint tokenId, address recipient) external lock { ensureVault(vault); ISignerVaultV3(vault).unlockERC721(erc721, tokenId, recipient, msg.sender); }
  function lockERC721(address vault, address erc721, uint tokenId, uint until) external payable { _lockERC721(vault, erc721, tokenId, until, false, address(0)); }
  function lockERC721OnPartner(address vault, address erc721, uint tokenId, uint until, address partner) external payable { _lockERC721(vault, erc721, tokenId, until, true, partner); }
  function lockERC721Permanently(address vault, address erc721, uint tokenId) external payable { _lockERC721(vault, erc721, tokenId, UINT_MAX_VALUE, false, address(0)); }
  function lockERC721PermanentlyOnPartner(address vault, address erc721, uint tokenId, address partner) external payable { _lockERC721(vault, erc721, tokenId, UINT_MAX_VALUE, true, partner); }

  function swapLiquidity(address vault, address token, uint removeLiquidity, address[] calldata swapPath, uint deadline) external payable  { _swapLiquidity(vault, token, removeLiquidity, 0, 0, 0, swapPath, 0, 0, deadline, false, address(0)); }
  function swapLiquidityOnPartner(address vault, address token, uint removeLiquidity, address[] calldata swapPath, uint deadline, address partner) external payable  { _swapLiquidity(vault, token, removeLiquidity, 0, 0, 0, swapPath, 0, 0, deadline, true, partner); }
  function swapLiquidity(address vault, address token, uint removeLiquidity, uint swapAmountOutMin, address[] calldata swapPath, uint deadline) external payable  { _swapLiquidity(vault, token, removeLiquidity, 0, 0, swapAmountOutMin, swapPath, 0, 0, deadline, false, address(0)); }
  function swapLiquidityOnPartner(address vault, address token, uint removeLiquidity, uint swapAmountOutMin, address[] calldata swapPath, uint deadline, address partner) external payable  { _swapLiquidity(vault, token, removeLiquidity, 0, 0, swapAmountOutMin, swapPath, 0, 0, deadline, true, partner); }
  function swapLiquidity(address vault, address token, uint removeLiquidity, uint removeAmountAMin, uint removeAmountBMin, uint swapAmountOutMin, address[] calldata swapPath, uint addAmountAMin, uint addAmountBMin, uint deadline) external payable { _swapLiquidity(vault, token, removeLiquidity, removeAmountAMin, removeAmountBMin, swapAmountOutMin, swapPath, addAmountAMin, addAmountBMin, deadline, false, address(0)); }
  function swapLiquidityOnPartner(address vault, address token, uint removeLiquidity, uint removeAmountAMin, uint removeAmountBMin, uint swapAmountOutMin, address[] calldata swapPath, uint addAmountAMin, uint addAmountBMin, uint deadline, address partner) external payable { _swapLiquidity(vault, token, removeLiquidity, removeAmountAMin, removeAmountBMin, swapAmountOutMin, swapPath, addAmountAMin, addAmountBMin, deadline, true, partner); }

  function _lockMultiple(address vault, CurrencyType[] calldata currencyTypes, address[] calldata ids, uint[] memory values, uint[] calldata untils, bool onPartner, address partner) private lock {
    ensureVaultOnly(vault);

    require(currencyTypes.length == ids.length && currencyTypes.length == values.length && currencyTypes.length == untils.length, "Vault: array size mismatch");

    (uint amount, uint fee) = _calculateAmountAndFee(vault, currencyTypes, values);
    values = _transferMultiple(vault, currencyTypes, ids, values);

    if (onPartner)
      ensureAmountAndFeeOnPartner(amount, fee, partner);
    else
      ensureAmountAndFee(amount, fee);

    for (uint index = 0; index < currencyTypes.length; index++)
      ISignerVaultV3(vault).lockCurrency{ value: currencyTypes[index] == CurrencyType.ETH ? values[index] : 0 }(currencyTypes[index], ids[index], values[index], untils[index]);
  }

  function _lockETH(address vault, uint amount, uint until, bool onPartner, address partner) private lock {
    ensureVaultOnly(vault);

    if (onPartner)
      ensureAmountAndFeeOnPartner(amount, IFeeCollectorV2(_feeCollector).lockETHFee(vault, msg.sender), partner);
    else
      ensureAmountAndFee(amount, IFeeCollectorV2(_feeCollector).lockETHFee(vault, msg.sender));

    ISignerVaultV3(vault).lockETH{ value: amount }(amount, until);
  }

  function _lockToken(address vault, address token, uint amount, uint until, bool onPartner, address partner) private lock {
    ensureVaultOnly(vault);

    if (onPartner)
      ensureFeeOnPartner(IFeeCollectorV2(_feeCollector).lockTokenFee(vault, msg.sender), partner);
    else
      ensureFee(IFeeCollectorV2(_feeCollector).lockTokenFee(vault, msg.sender));

    uint balanceBefore = IERC20(token).balanceOf(vault);
    TransferHelper.safeTransferFrom(token, msg.sender, vault, amount);
    amount = IERC20(token).balanceOf(vault) - balanceBefore;

    ISignerVaultV3(vault).lockToken(token, amount, until);
  }

  function _lockERC721(address vault, address erc721, uint tokenId, uint until, bool onPartner, address partner) private lock {
    ensureVaultOnly(vault);

    if (onPartner)
      ensureFeeOnPartner(IFeeCollectorV2(_feeCollector).lockERC721Fee(vault, msg.sender), partner);
    else
      ensureFee(IFeeCollectorV2(_feeCollector).lockERC721Fee(vault, msg.sender));

    TransferHelper.safeTransferFrom(erc721, msg.sender, vault, tokenId);

    ISignerVaultV3(vault).lockERC721(erc721, tokenId, until);
  }

  function _swapLiquidity(address vault, address token, uint removeLiquidity, uint removeAmountAMin, uint removeAmountBMin, uint swapAmountOutMin, address[] calldata swapPath, uint addAmountAMin, uint addAmountBMin, uint deadline, bool onPartner, address partner) private lock {
    ensureVault(vault);

    if (onPartner)
      ensureFeeOnPartner(IFeeCollectorV2(_feeCollector).swapLiquidityFee(vault, msg.sender), partner);
    else
      ensureFee(IFeeCollectorV2(_feeCollector).swapLiquidityFee(vault, msg.sender));

    ISignerVaultV3(vault).swapLiquidity(token, removeLiquidity, removeAmountAMin, removeAmountBMin, swapAmountOutMin, swapPath, addAmountAMin, addAmountBMin, deadline);
  }

  function _calculateAmountAndFee(address vault, CurrencyType[] calldata currencyTypes, uint[] memory values) private view returns (uint amount, uint fee) {
    Fees memory fees_ = IFeeCollectorV2(_feeCollector).fees(vault, msg.sender);
    for (uint index = 0; index < currencyTypes.length; index++) {
        if (currencyTypes[index] == CurrencyType.ETH) {
          amount += values[index];
          fee += fees_.lockETH;
        } else if (currencyTypes[index] == CurrencyType.Token)
          fee += fees_.lockToken;
        else if (currencyTypes[index] == CurrencyType.ERC721)
          fee += fees_.lockERC721;
        else
          revert("Vault: invalid currencyType");
    }
  }

  function _transferMultiple(address vault, CurrencyType[] calldata currencyTypes, address[] calldata ids, uint[] memory values) private returns (uint[] memory) {
    for (uint index = 0; index < currencyTypes.length; index++)
      if (currencyTypes[index] != CurrencyType.ETH)
        values[index] = TransferHelperV2.safeTransferCurrency(currencyTypes[index], ids[index], msg.sender, vault, values[index]);

    return values;
  }
}