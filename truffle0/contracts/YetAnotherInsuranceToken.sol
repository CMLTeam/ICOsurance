pragma solidity ^0.4.2;


import './OwnedToken.sol';


contract YetAnotherInsuranceToken is OwnedToken {
	function YetAnotherInsuranceToken() OwnedToken("YIT", "Yet Another Insurance Token - ERC20", 18, 1024) {

	}
}
