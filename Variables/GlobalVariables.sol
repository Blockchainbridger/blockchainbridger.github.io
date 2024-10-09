// SPDX-License-Identifier: MIT
pragma solidity^0.8;

contract GlobalVariables{
    address public owner;
    address public Myblockhash;
    uint256 public difficulty;
    uint256 public number;
    uint256 public gaslimit;
    uint256 public timestamp;
    uint256 public value;
    uint256 public nowOn;
    address public origin;
    uint256 public gasprice;
    bytes public callData;
    bytes public Firstfour;



    constructor(){
        owner = msg.sender;
        //0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
        //0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
        Myblockhash = block.coinbase;
        difficulty = block.difficulty;
        gaslimit = block.gaslimit;
        number = block.number;
        timestamp = block.timestamp; 
        origin = tx.origin;
        gasprice = tx.gasprice;
        callData = msg.data;
    }
}