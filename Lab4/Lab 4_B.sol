// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PersonInfo {
    struct Person {
        string name;
        uint256 age;
    }

    Person public person;

    function setPerson(string memory name, uint256 age) public {
        person = Person(name, age);
    }

    function getPerson() public view returns (Person memory) {
        return person;
    }
}