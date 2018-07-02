pragma solidity ^0.4.23;

import "./Whitelist.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract SimpleWhitelistToken is StandardToken {

    /*----------- Globals -----------*/
    string public name;
    uint8 public decimals;
    string public symbol;
    SimpleWhitelist public whitelist;

    /*----------- Modifier -----------*/
    modifier onlyWhitelist(address recipient) {
        require(whitelist.isWhitelisted(recipient));
        _;
    }

    constructor (
        uint256 _totalSupply,
        string _name,
        string _symbol,
        uint8 _decimals,
        address _whitelist
    ) public {
        totalSupply_ = _totalSupply;
        balances[msg.sender] = _totalSupply;
        name = _name;
        decimals = _decimals;
        symbol = _symbol;
        whitelist = SimpleWhitelist(_whitelist);
    }

    /*----------- Whitelisted Methods -----------*/
    /**
    * @dev Transfer tokens from sender's address to another
    * @param _to address The address which you want to transfer to
    * @param _value uint256 the amount of tokens to be transferred
    */
    function transfer(address _to, uint256 _value) 
        public
        onlyWhitelist(_to)
        returns (bool success) 
    {
        super.transfer(_to, _value);
        
        return true;
    }

    /**
    * @dev Transfer tokens from one address to another
    * @param _from address The address which you want to send tokens from
    * @param _to address The address which you want to transfer to
    * @param _value uint256 the amount of tokens to be transferred
    */
    function transferFrom(address _from, address _to, uint256 _value) 
        public 
        onlyWhitelist(_to)
        returns (bool success) 
    {   
        super.transferFrom(_from, _to, _value);

        return true;
    }
}
