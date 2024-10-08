// SPDX-License-Identifier: MIT
pragma solidity^0.8;

//contract Require{
   // function checkInput(uint _input) public pure returns(string memory){
      //  require(_input >= 0, "invalid uint8");
      //  require(_input <= 255, "inavlid uint8");
       // return "Input is uint8";
  //  }
//}

//contract Assert{

  //  bool public result;
  //  function checkOverFlow(uint _num1, uint _num2) public{
     //   uint sum = _num1 + _num2;
     //   assert(sum <=255);
      //  result = true;
   // }
   // function getResult() public view returns(string memory){
    //    if(result == true){
       //     return "No Overflow";
       //     } else {
        //    return "Overflow";
       // }
   // }
//}

contract RevertStatement{
    function CheckOverFlow(uint _num1, uint _num2) public pure returns(string memory, uint){
        uint sum = _num1 + _num2;
        if(sum < 0 || sum > 255){
            revert ("Overflow exist");
        } else{
            return ("No Overflow", sum);
        }
        
    }
}