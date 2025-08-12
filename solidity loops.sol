// SPDX-License-Identifier: MIT

// create a loop to calculate all expenses variable with uint type
// HINT: create a local expenses variable with uint type
// HINT: loop over expenses array with for loop 
// HINT: add up all expenses cost
// HINT: return total expenses 

pragma solidity ^0.8.0;

contract ExpenseTracker {
    struct Expense {
        address user;
        string description;
        uint amount;
    }

    Expense[] public expenses;
    
    constructor () {
        expenses.push(Expense(msg.sender, "Groceries", 50));
        expenses.push(Expense(msg.sender, "Transportation", 30));
        expenses.push(Expense(msg.sender, "Dining Out", 25));
    }
    function addExpense (string memory _description, uint _amount) public {
        expenses.push(Expense(msg.sender, _description, _amount));
    }

    function getTotalExpenses (address _user) public view returns (uint) {
    // your code here
       uint256 TotalExpenses;

    for(uint i = 0; i < expenses.length; i++) {
        if (expenses[i].user == _user) {
            TotalExpenses += expenses[i].amount;
        }

    }
    
    return TotalExpenses; 

}


}