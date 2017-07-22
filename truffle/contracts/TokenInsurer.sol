pragma solidity ^0.4.8;
import './PayableToken.sol';

contract TokenInsurer is PayableToken {
	address owner;
	mapping (address => uint256) approvedFeesPpm;

	function TokenInsurer(string _name, string _symbol) PayableToken(_name, _symbol) {
		owner = msg.sender;
	}



}
