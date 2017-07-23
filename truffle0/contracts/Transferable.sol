pragma solidity ^0.4.2;


contract Transferable {
	function transfer(address _to, uint256 _value) returns (bool success);
}
