pragma solidity ^0.4.23;

import "../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol";


contract SimpleWhitelist is Ownable {
    /*----------- Globals -----------*/

    mapping(address => bool) public whitelist;

    /*----------- Events -----------*/
    event LogAddAddress(address sender, address nowOkay);
    event LogRemoveAddress(address sender, address deleted);

    /*----------- Owner Methods -----------*/
    function addAddress(address _okay)
        public
        onlyOwner
        returns(bool success)
    {
        require(_okay != address(0));
        require(!isWhitelisted(_okay));
        whitelist[_okay] = true;
        emit LogAddAddress(msg.sender, _okay);
        return true;
    }

    function removeAddress(address _delete)
        public
        onlyOwner
        returns(bool success)
    {
        require(isWhitelisted(_delete));
        whitelist[_delete] = false;
        emit LogRemoveAddress(msg.sender, _delete);
        return true;
    }

    /*----------- Constants -----------*/
    function isWhitelisted(address _check)
        public
        view
        returns(bool isIndeed)
    {
        return whitelist[_check];
    }
}