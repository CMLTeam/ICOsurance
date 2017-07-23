pragma solidity ^0.4.8;

import "./ERC20.sol";

//
// Insurance Token is based on ERC20. The main difference is that it won't have fixed total supply since
// its emission is chained with emmision of ICO token.
//
// For every ICO it's own instance of InsuranceToken will be deployed.
//
// The investors will have the ability to see the Insurance tokens in their wallet but won't be able
// to sell them back to this contract (to recover their ETH) till this is unlocked by Insurer Company
// after Claim investigation.
//
contract InsuranceToken is ERC20 {
	string public constant symbol;
	string public constant name;
	uint8 public constant decimals = 18;
	uint insurancePercent = 10; // TODO should depend on ICO symbol

	// Owner of this contract
    // This should be belonging to Insurance company
	address public owner;

	// Balances for each account
	mapping(address => uint256) balances;

	// Owner of account approves the transfer of an amount to another account
	mapping(address => mapping (address => uint256)) allowed;

	// Functions with this modifier can only be executed by the owner
	modifier onlyOwner() {
		if (msg.sender != owner) {
			throw;
		}
		_;
	}
	// Constructor
	function InsuranceToken(string icoSymbol) {
		symbol = icoSymbol + "_INS";
		name = icoSymbol + " Insurance Token";
		owner = msg.sender;
	}
//	function totalSupply() constant returns (uint256 totalSupply) {
//	}
	// What is the balance of a particular account?
	function balanceOf(address _owner) constant returns (uint256 balance) {
		return balances[_owner];
	}
	// Transfer the balance from owner's account to another account
	function transfer(address _to, uint256 _amount) returns (bool success) {
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
	// Send _value amount of tokens from address _from to address _to
	// The transferFrom method is used for a withdraw workflow, allowing contracts to send
	// tokens on your behalf, for example to "deposit" to a contract address and/or to charge
	// fees in sub-currencies; the command should fail unless the _from account has
	// deliberately authorized the sender of the message via some mechanism; we propose
	// these standardized APIs for approval:
	function transferFrom(address _from, address _to, uint256 _amount) returns (bool success) {
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

	// issue insurance token to the investor in exchange to ETH
	function () payable {
		uint ethSentByCrowdsale = msg.value;
	    owner.transfer(ethSentByCrowdsale);
		balances[tx.origin] = ethSentByCrowdsale;
	}
}
