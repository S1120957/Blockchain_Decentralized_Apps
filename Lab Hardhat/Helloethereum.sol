// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloEthereum {
    string public message;	 // message is a public state variable storing a string

    // Constructor that initializes the contract with a message 	
    constructor(string memory initialMessage) {       //The contract’s constructor initializes a message with a value when the contract is deployed.

        message = initialMessage;
    }

    // Function to update the message
    function updateMessage(string memory newMessage) public {         // updateMessage is a function allowing anyone to change the stored message.
        message = newMessage;
    }
}
