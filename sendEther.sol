// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
contract SendEther {
    constructor() payable {}
    // Function to receive Ether
    receive() external payable {}
     function sendViaTransfer(address payable _to) external  payable {
        _to.transfer(123);
     }
    function sendViaSend(address payable _to) external  payable {
        bool sent = _to.send(123);
        require(sent, "send failed");
    }
        function sendViaCall(address payable _to) public payable {
        (bool success, ) = _to.call{value: 123}("");
        require(success, "Call failed");
    }
}     
  
contract EthReceiver{
    event Log(uint amount,uint gas);
    receive() external payable {emit Log(msg.value,gasleft());
     }
}
