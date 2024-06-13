// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentDatabase {
    // Structure to store student information
    struct Student {
        uint id;
        string name;
        uint age;
        string class;
    }

    // Array to store list of students
    Student[] private students;

    // Mapping to store student IDs to their index in the array for easy access
    mapping(uint => uint) private studentIdToIndex;

    // Event to log addition of a new student
    event StudentAdded(uint id, string name, uint age, string class);

    // Function to add a new student
    function addStudent(uint _id, string memory _name, uint _age, string memory _class) public {
        require(_id > 0, "Student ID must be greater than zero");
        require(bytes(_name).length > 0, "Student name must not be empty");
        require(_age > 0, "Student age must be greater than zero");
        require(bytes(_class).length > 0, "Student class must not be empty");

        // Create a new student struct and add it to the array
        students.push(Student(_id, _name, _age, _class));

        // Map the student ID to the index in the array
        studentIdToIndex[_id] = students.length - 1;

        emit StudentAdded(_id, _name, _age, _class);
    }

    // Function to get student details by ID
    function getStudent(uint _id) public view returns (uint, string memory, uint, string memory) {
        require(_id > 0, "Student ID must be greater than zero");
        
        uint index = studentIdToIndex[_id];
        Student memory student = students[index];
        
        return (student.id, student.name, student.age, student.class);
    }

    // Function to get the total number of students
    function getStudentCount() public view returns (uint) {
        return students.length;
    }

    // Fallback function to handle unexpected calls
    fallback() external payable {
        revert("Function not supported");
    }
    
    // Receive function to accept ether transfers
    receive() external payable {
        // Accept ether transfers
    }
}

