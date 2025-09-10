// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract FixedArray {
    // Declare a fixed size array
    int[5] public data;

    // Function to populate array
    function populate() public returns (int[5] memory) {
        data = [int(9), int(2), int(8), int(4), int(6)];
        return data;
    }
}
