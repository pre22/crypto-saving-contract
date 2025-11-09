// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.30;

contract CryptoSavings {
    mapping (address => uint256) private balances;
    address public owner;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor() {
        owner = msg.sender;    
    }

    // Deposit Eth to savings
    function deposit() external payable () {
        require(msg.value > 0, "Amount must be greater than zero");
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    // Withdraw Eth from savings
    function withdraw(uint256 amount) external {
        require(amount > 0, "Invalid amount");
        require(balances[msg.sender] >= amount, "Insuffienct balance");

        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);

        emit Withdraw(msg.sender, amount);
    }

    // Check users balance
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // Check total contract balance
    function contractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}