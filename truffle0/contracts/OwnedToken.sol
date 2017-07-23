pragma solidity ^0.4.2;


import './Token.sol';


contract OwnedToken is Token {
	address owner;

	function OwnedToken(string _name, string _symbol, uint8 _decimals, uint256 _count) Token(_name, _symbol, _decimals, _count) {
		owner = msg.sender;
	}

	modifier onlyBy(address _account) {
		require(msg.sender == _account);
		_;
	}


}
