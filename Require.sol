// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract RequireStatement {
    function checkInput(uint _input) public pure returns (string memory) {
        require(_input <= 255, "invalid uint8");
        return "Input is Uint8";
    }

    function odd(uint _input) public pure returns (bool) {
        require(_input % 2 != 0, "Not an odd number");
        return true;
    }
}
