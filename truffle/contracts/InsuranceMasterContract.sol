pragma solidity ^0.4.8;

import "./InsuranceToken.sol";

contract InsuranceMasterContract {
    address owner;
    mapping(address => bool) tokensByAddress;
    mapping(string => bool) tokensBySymbol;

    function InsuranceMasterContract() {
        owner = msg.sender;
    }

    function createNew(string icoSymbol) {
        address token = new InsuranceToken();
        tokensByAddress[token] = true;
        tokensBySymbol[icoSymbol] = true;
    }

    function validateBySymbol(string icoSymbol) returns (bool) {
        return tokensBySymbol[icoSymbol];
    }
    function validateByAddress(address icoTokenAddr) returns (bool) {
        return tokensByAddress[icoTokenAddr];
    }
}