// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract MedicalHistory {

    // Define a struct to store patient details
    struct Patient {
        string name;          // Patient's name
        uint age;             // Patient's age
        string[] conditions;  // List of medical conditions
        string[] allergies;   // List of allergies
        string[] medication;  // List of medications
        string[] procedures;  // List of medical procedures
    }

    // Mapping to store each patient's data, indexed by their address
    mapping(address => Patient) public patients;

    // Function to add a new patient to the contract
    function addPatient(
        string memory _name,
        uint _age,
        string[] memory _conditions,
        string[] memory _allergies,
        string[] memory _medication,
        string[] memory _procedures
    ) public {
        // Create a new patient struct and store it in the mapping
        Patient memory patient = Patient(_name, _age, _conditions, _allergies, _medication, _procedures);
        patients[msg.sender] = patient; // Save patient data linked to msg.sender (the caller)
    }

    // Function to update existing patient details (conditions, allergies, medication, procedures)
    function updatePatient(
        string[] memory _conditions,
        string[] memory _allergies,
        string[] memory _medication,
        string[] memory _procedures
    ) public {
        // Retrieve the patient from storage and update their details
        Patient storage patient = patients[msg.sender];
        patient.conditions = _conditions;
        patient.allergies = _allergies;
        patient.medication = _medication;
        patient.procedures = _procedures;
    }

    // Function to retrieve patient details
    function getPatient(address _patientAddress) public view returns (
        string memory,
        uint,
        string[] memory,
        string[] memory,
        string[] memory,
        string[] memory
    ) {
        // Retrieve the patient details for the given address
        Patient memory patient = patients[_patientAddress];
        return (
            patient.name, 
            patient.age, 
            patient.conditions, 
            patient.allergies, 
            patient.medication, 
            patient.procedures
        );
    }
}
