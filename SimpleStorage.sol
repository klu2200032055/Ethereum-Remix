pragma solidity ^0.8.26;

contract SimpleStorage {
    uint256 private number;

    // Store a number
    function set(uint256 _num) external {
        number = _num;
    }

    // Retrieve the number
    function get() external view returns (uint256) {
        return number;
    }
}
