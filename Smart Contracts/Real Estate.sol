// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";


// Real Estate contract for buying and selling properties
contract RealEstate{
    using SafeMath for uint256;

    struct Property {
        uint256 price;   // price of the property
        address owner;   // owner "
        bool forSale;    // Is the property for sale?
        string name;     // name of the property
        string description;   // description of the property
        string location;     // location of the property
    }

// Mapping the property IDs to the Struct
    mapping(uint => Property) public properties;

// Array of all property Ids
    uint[] public propertyIds;


    event PropertySold(uint propertyIds);


    function ListPropertyForSale(uint _propertyId, uint _price, string memory _name, string memory _description, string memory 
    _location) public{

        Property memory newProperty = Property({
            price : _price,
            owner : msg.sender, 
            forSale : true, 
           name : _name, 
           description : _description, 
          location : _location
        });

        properties[_propertyId] = newProperty;
        propertyIds.push(_propertyId);
    }

    function buyProperty(uint _propertyId) public payable {
        Property storage property = properties[_propertyId];

        require(property.forSale, 'The property is not for sale'); 
        require(property.price <= msg.value, "Insufficient funds");

        property.owner = msg.sender;
        property.forSale = false; 

        payable(property.owner).transfer(property.price);

        emit PropertySold(_propertyId);
     }
    }