// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Animal {
    string public species;

    constructor(string memory _species) {
        species = _species;
    }

    function makeSound() public pure virtual returns (string memory);
}

contract Dog is Animal {
    string public name;

    constructor(string memory _name) Animal("Canine") {
        name = _name;
    }

    function makeSound() public pure override returns (string memory) {
        return "Bark!";
    }
}

contract Cat is Animal {
    string public name;

    constructor(string memory _name) Animal("Feline") {
        name = _name;
    }

    function makeSound() public pure override returns (string memory) {
        return "Meow!";
    }
}
