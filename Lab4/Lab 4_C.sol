// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructArray {
    struct Person {
        string name;
        string eventt;
    }

    Person[] public persons;

    function addPerson(string memory name, string memory eventt) public {
        persons.push(Person(name, eventt));
    }
}