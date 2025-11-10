// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NestedStruct {
    struct Address {
        uint streetNo;
        string city;
    }

    struct Student {
        string name;
        bool status;
        Address addressDetails;
    }

    Student[] public students;

    function addStudent(string memory name, bool status, uint streetNo, string memory city) public {
        Address memory addr = Address(streetNo, city);
        students.push(Student(name, status, addr));
    }

    function getStudent(uint index) public view returns (Student memory) {
        return students[index];
    }
}