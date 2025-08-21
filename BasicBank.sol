pragma solidity ^0.8.26;

contract BasicBank {
    mapping(address => uint256) public balances;

    // Deposit ETH
    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    // Withdraw ETH
    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Not enough balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
