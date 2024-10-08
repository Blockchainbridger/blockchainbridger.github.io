// SPDX-License-Identifier: MIT
pragma solidity ^0.8 ;


contract Base{
     
     function privateFunc() private pure returns(string memory){
        return "private func called";

     }
     function testPrivateFunc() public pure returns(string memory){
        return privateFunc();   
     }

     function internalFunc() internal pure returns(string memory) {
        return  "Internal func called";
     }

     function testInternalFunc() public pure virtual returns(string memory){
        return "internalFunc()";
     }
     function publicFunc() external pure returns(string memory) {  
        return "external function called";
     }

     string private privatevar = "my private variable";
     string internal internalvar = "my internal variable";
     string public publicvar = "my public variable";


}

contract Child is Base{
    function testInternalFunc() public pure override  virtual returns (string memory) {  
        return internalFunc();
    }
}