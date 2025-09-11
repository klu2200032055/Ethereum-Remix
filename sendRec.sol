// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SendEther {
    // Function to receive Ether
    receive() external payable {}

    // Check balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // --------- Sending Ether ------------

    // 1. Using transfer (auto reverts on failure, forwards 2300 gas)
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    // 2. Using send (returns bool, forwards 2300 gas)
    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Send failed");
    }

    // 3. Using call (recommended, forwards all gas unless specified)
    function sendViaCall(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Call failed");
    }
}
contract EthReceiver{
    event Log(uint amount,uint gas);
    receive() external payable {emit Log(msg.value,gasleft());
     }
}
