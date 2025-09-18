// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// Base contract X
contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

// Base contract Y
contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// Passing parameters directly in the inheritance list
contract B is X("Input to X"), Y("Input to Y") {}

// Passing parameters via constructor (like modifiers)
contract C is X, Y {
    constructor(string memory _name, string memory _text) 
        X(_name) 
        Y(_text) 
    {}
}

// Explicit parameters in constructor
contract D is X, Y {
    constructor() 
        X("X was called") 
        Y("Y was called") 
    {}
}

// Demonstrating constructor call order
// NOTE: Even though Y is called before X in the constructor,
// X will still be executed first because of inheritance order (X, then Y).
contract E is X, Y {
    constructor() 
        Y("Y was called") 
        X("X was called") 
    {}
}
