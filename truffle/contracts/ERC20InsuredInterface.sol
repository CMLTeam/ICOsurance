pragma solidity ^0.4.8;

import "./ERC20Interface.sol";

// Enhanced ERC20 interface that encapsulates insurance logic
contract ERC20InsuredInterface is ERC20Interface {
    function transfer(address _to, uint256 _value) returns (bool success) {
        return transferInsured(_to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        return transferInsuredFrom(_from, _to, _value);
    }

    // transfer method to be implemented instead of transfer
    function transferInsured(address _to, uint256 _value) returns (bool success);

    // transfer method to be implemented instead of transferFrom
    function transferInsuredFrom(address _from, address _to, uint256 _value) returns (bool success);
}
