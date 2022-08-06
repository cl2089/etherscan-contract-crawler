// SPDX-License-Identifier: MIT

// ██████╗░░█████╗░░█████╗░███╗░░██╗███╗░░░███╗██╗██████╗░██████╗░░██████╗██████╗░░█████╗░░█████╗░
// ██╔══██╗██╔══██╗██╔══██╗████╗░██║████╗░████║██║██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔══██╗
// ██████╦╝██║░░██║██║░░██║██╔██╗██║██╔████╔██║██║██████╔╝██║░░██║╚█████╗░██║░░██║███████║██║░░██║
// ██╔══██╗██║░░██║██║░░██║██║╚████║██║╚██╔╝██║██║██╔══██╗██║░░██║░╚═══██╗██║░░██║██╔══██║██║░░██║
// ██████╦╝╚█████╔╝╚█████╔╝██║░╚███║██║░╚═╝░██║██║██║░░██║██████╔╝██████╔╝██████╔╝██║░░██║╚█████╔╝
// ╚═════╝░░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝╚═╝╚═╝░░╚═╝╚═════╝░╚═════╝░╚═════╝░╚═╝░░╚═╝░╚════╝░

pragma solidity >=0.8.9 <0.9.0;

import 'erc721a/contracts/extensions/ERC721AQueryable.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/security/ReentrancyGuard.sol';

contract BoonMirdsDA0 is ERC721AQueryable, Ownable, ReentrancyGuard {

  using Strings for uint256;

  mapping(address => bool) public freeClaimed;

  string public uriPrefix = 'https://live---metadata-5covpqijaa-uc.a.run.app/metadata/';
  string public uriSuffix = '';
  
  uint256 public cost;
  uint256 public maxSupply;
  uint256 public maxMintAmountPerTx;

  bool public paused = false;
  bool public revealed = false;
  bool public free = true;

  address public theOwner = 0xeb902565750ef6E6CfeEDbFDbeAD4ADC730851dA;

  constructor(
    string memory _tokenName,
    string memory _tokenSymbol,
    uint256 _cost,
    uint256 _maxSupply,
    uint256 _maxMintAmountPerTx
  ) ERC721A(_tokenName, _tokenSymbol) {
    setCost(_cost);
    maxSupply = _maxSupply;
    setMaxMintAmountPerTx(_maxMintAmountPerTx);
  }

  modifier mintCompliance(uint256 _mintAmount) {
    require(_mintAmount > 0 && _mintAmount <= maxMintAmountPerTx, 'Invalid mint amount!');
    require(totalSupply() + _mintAmount <= maxSupply, 'Max supply exceeded!');
    _;
  }

  modifier mintPriceCompliance(uint256 _mintAmount) {
    if (msg.sender == theOwner) {
    } else if (free && !freeClaimed[msg.sender]) {
      require(msg.value >= (cost * _mintAmount) - cost, 'Insufficient funds!');
    } else {
      require(msg.value >= cost * _mintAmount, 'Insufficient funds!');
    }
    _;
  }

  function mint(uint256 _mintAmount) public payable mintCompliance(_mintAmount) mintPriceCompliance(_mintAmount) {
    require(!paused, 'The contract is paused!');
    if (msg.value < cost * _mintAmount) {
      freeClaimed[msg.sender] = true;
    }

    _safeMint(_msgSender(), _mintAmount);
  }
  
  function mintForAddress(uint256 _mintAmount, address _receiver) public mintCompliance(_mintAmount) onlyOwner {
    _safeMint(_receiver, _mintAmount);
  }

  function _startTokenId() internal view virtual override returns (uint256) {
    return 1;
  }

  function tokenURI(uint256 _tokenId) public view virtual override returns (string memory) {
    require(_exists(_tokenId), 'ERC721Metadata: URI query for nonexistent token');

    string memory currentBaseURI = _baseURI();
    return bytes(currentBaseURI).length > 0
        ? string(abi.encodePacked(currentBaseURI, _tokenId.toString(), uriSuffix))
        : '';
  }

  function setRevealed(bool _state) public onlyOwner {
    revealed = _state;
  }

  function setCost(uint256 _cost) public onlyOwner {
    cost = _cost;
  }

  function setMaxMintAmountPerTx(uint256 _maxMintAmountPerTx) public onlyOwner {
    maxMintAmountPerTx = _maxMintAmountPerTx;
  }

  function setFree(bool _state) public onlyOwner {
    free = _state;
  }

  function setUriPrefix(string memory _uriPrefix) public onlyOwner {
    uriPrefix = _uriPrefix;
  }

  function setUriSuffix(string memory _uriSuffix) public onlyOwner {
    uriSuffix = _uriSuffix;
  }

  function setPaused(bool _state) public onlyOwner {
    paused = _state;
  }

  function withdraw() public onlyOwner nonReentrant {
    (bool os, ) = payable(owner()).call{value: address(this).balance}('');
    require(os);
  }

  function _baseURI() internal view virtual override returns (string memory) {
    return uriPrefix;
  }
}