pragma solidity ^0.5.0;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract TutorialToken is ERC20 {
    string public name = "TutorialToken";
    string public symbol = "TT";
    
    uint public INITIAL_SUPPLY = 12000;
    uint8 public decimals = 2;

    constructor() public {
        _mint(msg.sender, INITIAL_SUPPLY);
    }
}