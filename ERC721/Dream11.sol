pragma solidity ^0.5.1;


import 'https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol';

contract Dream11  is ERC721{
    
    struct Player{
        string name;
        uint age;
        string country;
    }
    
    Player[] public players;
    
    address public owner;
    
    constructor() public{
        owner = msg.sender;    
    }
    
    function createItem(string memory _name , address _to) public  {
        require(owner == msg.sender);
        uint id = players.length;
        players.push(Player(_name,5,"India"));
        _mint(_to,id);
    }
    
}