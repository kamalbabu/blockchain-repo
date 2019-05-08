pragma solidity >=0.4.22 <0.6.0;


contract  KBToken {
    //State variable
    
    //Name of EYToken
    
    string public name ="KB Token";
    
    //Symbol of  EYToken
    
    
    string public Symbol ="KBT";
    
    //Inital supply
    
    uint256 intialSupply =100000;


    //decimal points
    uint256 decimals  =2;
    
    mapping(address => uint256) balanceOf;
    
    //constructor
    
    
    constructor() public payable{
        balanceOf[msg.sender] = intialSupply;
    }
    
    
    //method tranfer
    
    
    function transfer(address _to,uint256 _value) public payable{
        require(balanceOf[msg.sender]>_value);
        
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }
    
}