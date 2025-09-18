// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title EtherSender
 * @notice Demonstrates different ways to send Ether in Solidity
 */
contract EtherSender {
    // Allow contract to receive Ether directly
    receive() external payable {}

    // ====== 1. Using transfer ======
    // - Forwards 2300 gas
    // - Reverts if transfer fails
    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(msg.value);
    }

    // ====== 2. Using send ======
    // - Forwards 2300 gas
    // - Returns bool instead of reverting
    function sendViaSend(address payable _to) external payable {
        bool success = _to.send(msg.value);
        require(success, "Send failed");
    }

    // ====== 3. Using call (preferred) ======
    // - Forwards all available gas (adjustable)
    // - Returns success flag
    // - Recommended after Istanbul hard fork
    function sendViaCall(address payable _to) external payable {
        (bool success, ) = _to.call{value: msg.value}("");
        require(success, "Call failed");
    }
}

/**
 * @title Receiver
 * @notice Receives Ether and emits an event with gas info
 */
contract Receiver {
    event Received(address sender, uint amount, uint gas);

    // Triggered when non-matching function is called
    fallback() external payable {
        emit Received(msg.sender, msg.value, gasleft());
    }

    // Triggered when plain Ether is sent
    receive() external payable {
        emit Received(msg.sender, msg.value, gasleft());
    }
}
