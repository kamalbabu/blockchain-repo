pragma solidity ^0.5.1;


contract SplitterContract {

    mapping(address=> uint) usersMap;
    address[] users ;

    function send() public payable {
    require(msg.value > 0, "Ether is missing");
    require(users.length > 2, "Minimum number of 3 users required");
    address sender = msg.sender;
    uint amount = msg.value;

    for(uint i = 0 ; i < 3; i++){
        if(users[i] != sender){
        usersMap[users[i]]= amount/2;
        }
        }

    }

    function addUsers(address user) public isValidAccount(user) {
        usersMap[user] = 0;
        users.push(user);
    }

    modifier isValidAccount(address user)
    {
        require(address(o) != user, "Invalid account address");
        _;
    }

    function balance() public view returns(uint) {
         return msg.sender.balance;
    }

    function getAllUsers() public view returns( address[] memory ){
         return users;
    }

    function widthdrawAmount() public {

            uint balanceAmount = usersMap[msg.sender];
            usersMap[msg.sender] = 0;
            msg.sender.transfer(balanceAmount);

    }
}
