// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract C {
   // private state variable
   uint private data;
   
   // public state variable
   uint public info;

   // constructor
   constructor() {
      info = 10;
   }

   // private function
   function increment(uint a) private pure returns(uint) { 
      return a + 1; 
   }
   
   // public functions
   function updateData(uint a) public { 
      data = a; 
   }

   function getData() public view returns(uint) { 
      return data; 
   }

   // internal function
   function compute(uint a, uint b) internal pure returns (uint) { 
      return a + b; 
   }
}

// Derived Contract
contract E is C {
   uint private result;
   C private c;

   constructor() {
      c = new C();
   }  

   function getComputedResult() public returns(uint) {      
      result = compute(3, 5); 
      return result;
   }

   function getResult() public view returns(uint) { 
      return result; 
   }

   function getExternalInfo() public view returns(uint) { 
      return c.info(); 
   }
}
