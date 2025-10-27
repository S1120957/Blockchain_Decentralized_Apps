// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NestedStructMapping {
    struct Address {
        uint streetNo;
        string city;
    }

    struct Student {
        string name;
        bool status;
        Address addressDetails;
    }

    mapping(uint => Student) public studentRecords;

    function addStudent(
        uint id,
        string memory name,
        bool status,
        uint streetNo,
        string memory city
    ) public {
        studentRecords[id] = Student(name, status, Address(streetNo, city));
    }
}