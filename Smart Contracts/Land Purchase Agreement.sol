// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LandPurchaseAgreement {

    address public seller;
    address public buyer;
    string public landDescription;
    uint public price;
    bool public isPaymentCompleted;
    bool public isOwnershipTransferred;
    bool public contractCompleted;

    // Define events to monitor
    event PaymentMade(address indexed buyer, uint amount);
    event OwnershipTransferred(address indexed buyer, string landDescription);
    event ContractCompleted(address indexed buyer, address indexed seller);

    constructor(address _buyer, string memory _landDescription, uint _price) {
        seller = msg.sender;
        buyer = _buyer;
        landDescription = _landDescription;
        price = _price;
        isPaymentCompleted = false;
        isOwnershipTransferred = false;
        contractCompleted = false;
    }

    // Ensure that only the buyer can make the payment
    modifier onlyBuyer() {
        require(msg.sender == buyer, "Only the buyer can perform this action");
        _;
    }

    // Ensure that only the seller can transfer ownership
    modifier onlySeller() {
        require(msg.sender == seller, "Only the seller can perform this action");
        _;
    }

    // Buyer makes the payment for the land (stored in escrow)
    function makePayment() external payable onlyBuyer {
        require(msg.value == price, "Incorrect payment amount");
        require(!isPaymentCompleted, "Payment has already been completed");
        isPaymentCompleted = true;

        emit PaymentMade(msg.sender, msg.value);
    }

    // Seller confirms ownership transfer to the buyer
    function transferOwnership() external onlySeller {
        require(isPaymentCompleted, "Payment is not yet completed");
        require(!isOwnershipTransferred, "Ownership has already been transferred");

        isOwnershipTransferred = true;

        // Transfer funds to the seller
        payable(seller).transfer(price);

        emit OwnershipTransferred(buyer, landDescription);
    }

    // Seller completes the contract
    function completeContract() external onlySeller {
        require(isOwnershipTransferred, "Ownership has not been transferred");
        require(!contractCompleted, "Contract already completed");

        contractCompleted = true;

        emit ContractCompleted(buyer, seller);
    }

    // Fallback function to handle ether received
    receive() external payable {
        revert("Direct payments not allowed");
    }
}

