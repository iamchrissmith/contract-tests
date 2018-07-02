pragma solidity ^0.4.23;

contract SimpleWhitelistI {
    mapping(address => bool) public whitelist;
    function isWhitelisted(address _check) public view returns(bool isIndeed);
}