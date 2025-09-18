// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// Base Contract
contract Parent {
    string public parentName = "Parent Contract";

    function greet() public pure virtual returns (string memory) {
        return "Hello from Parent!";
    }
}

// Derived Contract
contract Child is Parent {
    string public childName = "Child Contract";

    // Overriding the greet function
    function greet() public pure override returns (string memory) {
        return "Hello from Child!";
    }
}
