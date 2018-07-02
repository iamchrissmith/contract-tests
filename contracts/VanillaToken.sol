pragma solidity ^0.4.23;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract VanillaToken is StandardToken {

    /*----------- Globals -----------*/
    string public name;
    uint8 public decimals;
    string public symbol;
  
    constructor(
        uint _totalSupply, 
        string _name,
        string _symbol,
        uint8 _decimals
    ) public {
        totalSupply_ = _totalSupply;
        balances[msg.sender] = _totalSupply;
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
    }
}
