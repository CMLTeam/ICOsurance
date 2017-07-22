pragma solidity ^0.4.8;

import "./ERC20InsuredInterface.sol";

contract FixedSupplyInsuredToken is ERC20InsuredInterface {
    string public constant symbol = "FIXED";
    string public constant name = "Example Fixed Supply Token (Insured)";
    uint8 public constant decimals = 18;
    uint256 _totalSupply = 1000000;
    address public owner;
    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;
    modifier onlyOwner() {
        if (msg.sender != owner) {
            throw;
        }
        _;
    }
    function FixedSupplyInsuredToken() {
        owner = msg.sender;
        balances[owner] = _totalSupply;
    }
    function totalSupply() constant returns (uint256 totalSupply) {
        totalSupply = _totalSupply;
    }
    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }
    function transferInsured(address _to, uint256 _amount) returns (bool success) {
        if (balances[msg.sender] >= _amount
        && _amount > 0
        && balances[_to] + _amount > balances[_to]) {
            balances[msg.sender] -= _amount;
            balances[_to] += _amount;
            Transfer(msg.sender, _to, _amount);
            return true;
        } else {
            return false;
        }
    }
    function transferInsuredFrom(
        address _from,
        address _to,
        uint256 _amount
    ) returns (bool success) {
        if (balances[_from] >= _amount
        && allowed[_from][msg.sender] >= _amount
        && _amount > 0
        && balances[_to] + _amount > balances[_to]) {
            balances[_from] -= _amount;
            allowed[_from][msg.sender] -= _amount;
            balances[_to] += _amount;
            Transfer(_from, _to, _amount);
            return true;
        } else {
            return false;
        }
    }

    // Allow _spender to withdraw from your account, multiple times, up to the _value amount.
    // If this function is called again it overwrites the current allowance with _value.
    function approve(address _spender, uint256 _amount) returns (bool success) {
        allowed[msg.sender][_spender] = _amount;
        Approval(msg.sender, _spender, _amount);
        return true;
    }

    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}