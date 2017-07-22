pragma solidity ^0.4.8;
import './Token.sol';

contract PayableToken is Token {
	function PayableToken(string _name, string _symbol) Token(_name, _symbol, 18, 0) {
	}

	function withdraw(uint _value) {
		if (balances[msg.sender] >= _value) {
			balances[msg.sender] -= _value;
			totalSupply          -= _value;
			if(!msg.sender.send(_value)) throw;
		}
	}

	function() payable {
		balances[msg.sender] += msg.value;
		totalSupply          += msg.value;
	}
}
