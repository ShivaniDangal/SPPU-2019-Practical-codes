// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank {
    // Mapping to store the balance of each account
    mapping(address => uint256) private balances;

    // Event to log deposits
    event Deposit(address indexed account, uint256 amount);

    // Event to log withdrawals
    event Withdraw(address indexed account, uint256 amount);

    // Function to add a new bank account
    function addAccount() external {
        require(balances[msg.sender] == 0, "Account already exists");
        balances[msg.sender] = 0;
    }

    // Function to deposit money into the account
    function deposit(uint256 amount) external {
        require(amount > 0, "Deposit amount must be greater than zero");
        
        balances[msg.sender] += amount;

        emit Deposit(msg.sender, amount);
    }

    // Function to withdraw money from the account
    function withdraw(uint256 amount) external {
        require(amount > 0, "Withdraw amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        
        emit Withdraw(msg.sender, amount);
    }

    // Function to check the balance of the account
    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }
}

