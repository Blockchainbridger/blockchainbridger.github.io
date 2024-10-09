// SPDX-License-Identifier: MIT
pragma solidity^0.8;

contract functionModifier{

     address public owner;
     uint public  x = 10;
     bool public locked;

     constructor(){
        owner=msg.sender;
         //owner=address(this);
     }
         modifier  onlyOwner(){
            require(msg.sender == owner, "Not Owner");
            _;
         }
         modifier  validateData(address _addr){
            require(_addr !=address(0), "Invalid Address");
            _;
     }
     function changeowner(address _newOwner) public onlyOwner validateData(_newOwner){
        owner = _newOwner;
     }

        modifier  noReentrancy(){
            require(!locked, "No reentrancy");
            locked = true;
            _;
            locked = false;

        }
        function decrement(uint i) public noReentrancy{
            x -= 1;
            if(i > 1){
                decrement(i - 1);
            }
        }
     
}