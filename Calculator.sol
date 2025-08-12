// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 0. Make a contract called calculator
// 1. create Result variable to store result
// 2. create functions to add, subtract, and multiply to result
// 3. create a function to get result

contract calculator {

    uint256 result = 0;

    function add (uint256 num) public {
       result += num; 
    }
    function subtract (uint256 num) public {
        result -= num;
    }

    function multiply (uint256 num) public {
        result *= num;
    }
    function getResult() public view returns (uint256) {
        return result;

    } 
}