// SPDX-License-Identifier: GPL-3.0
// Pragma defines Remix version

pragma solidity ^0.8.0;

contract ERC20Token {
    string public name = "MyToken";
    string public symbol = "FT";
    uint8 public decimals = 18;
    uint256 public totalSupply;
    address public  owner;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
     event mintEvent(address indexed _initAdd,address indexed _to, uint  _mintAmount );
      event burnEvent(address indexed _initAdd,address indexed _to, uint  _mintAmount );
 
    constructor(uint256 initialSupply) {
        totalSupply = initialSupply * 10 ** uint256(decimals);
        owner=msg.sender;
        balanceOf[owner] = totalSupply;
    }
     modifier onlyOwnerMint(){
        require(owner==msg.sender, "Owner is only allowed to mint");
        _;
     }

    function transfer(address to, uint256 value) external returns (bool) {
        require(to != address(0), "Invalid address");
        require(balanceOf[owner] >= value, "Insufficient balance");
        balanceOf[owner] -= value;
        balanceOf[to] += value;
        emit Transfer(owner, to, value);
        return true;
    }
    function approve(address spender, uint256 value) external returns (bool) {
        allowance[owner][spender] = value;
        emit Approval(owner, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) external returns (bool) {
        require(from != address(0), "Invalid address");
        require(to != address(0), "Invalid address");
        require(balanceOf[from] >= value, "Insufficient balance");
        require(allowance[from][owner] >= value, "Not enough Allowance");

        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][owner] -= value;

        emit Transfer(from, to, value);
        return true;
    }
    function getAllowance(address from, address spender) public view returns(uint) {
        return allowance[from][spender];
    }

     function minting(address _initAdd, address _toAdd, uint _mintAmount) public onlyOwnerMint ()  {
        _mintAmount = _mintAmount * 10 ** decimals;
        balanceOf[_toAdd]+=_mintAmount;
        totalSupply+=_mintAmount;
        emit mintEvent(_initAdd, _toAdd, _mintAmount );
    }
    // It will burn amount and update the given address and total supply
    function burning(address _initAdd, address _toAdd, uint _burAmount) public onlyOwnerMint ()  {
        _burAmount = _burAmount * 10 ** decimals;
        balanceOf[_toAdd]-=_burAmount;
        totalSupply-=_burAmount;
        emit burnEvent(_initAdd, _toAdd, _burAmount );
    }
}