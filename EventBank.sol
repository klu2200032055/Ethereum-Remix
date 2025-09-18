// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract EventBank {
    // Define an event
    event BalanceUpdated(address indexed user, uint amount);

    // Mapping for individual user balances
    mapping(address => uint) public balances;

    // Deposit function
    function deposit(uint _amount) public {
        balances[msg.sender] += _amount;
        emit BalanceUpdated(msg.sender, balances[msg.sender]);
    }

    // Withdraw function
    function withdraw(uint _amount) public {
        require(balances[msg.sender] >= _amount, "Not enough balance");
        balances[msg.sender] -= _amount;
        emit BalanceUpdated(msg.sender, balances[msg.sender]);
    }

    // Getter for user balance
    function getBalance(address _user) public view returns (uint) {
        return balances[_user];
    }
}
