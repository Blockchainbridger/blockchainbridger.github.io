// SPDX-License-Identifier: MIT
pragma solidity^0.8;

contract LocalVariables{

    uint256 public myNumber;

    function local() public returns(address, uint256, uint256){
        //local variables are stored on stack and can only be used inside this function
        uint256 i = 345;
        myNumber = i;

        i +=45;
        address myAddress = address(1);
        
        return (myAddress, myNumber, i);
        
    }
}