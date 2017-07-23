pragma solidity ^0.4.2;


import './Token.sol';


contract YetAnotherToken is Token {
	function YetAnotherToken() Token("YAT", "Yet Another Token - ERC20", 18, 1024) {
	}

}
