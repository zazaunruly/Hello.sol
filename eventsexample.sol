// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract EventExample {
    // Add an event called "NewuserRegistered' with 2 arguments
    // user as address type
    // user as string type
    // code here 

    event NewUserRegistered (address indexed user, string username);

    struct User {
        string username;
        uint256 age;
    }

    mapping (address => User) public users;

     function registerUser(string memory _username, uint256 _age) public {
        User storage newUser = users[msg.sender];
        newUser.age = _age;
    
    // emit the event with msg.sender and username as the inputs 
    // code here 
     emit NewUserRegistered(msg.sender, _username);
   }
 }