// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract NFTCount{

   uint256 public numberOfNFT;
   
   //CHECK total no. NFT
   function checkTotalNFT() public view returns(uint256){
    return numberOfNFT;
   }
   
   //add NFT number
   function addNFT() public{
    numberOfNFT += 1;
   }
   
   //delete NFT by 1
   function deleteNFT() public{
    numberOfNFT -= 1;

   }

}