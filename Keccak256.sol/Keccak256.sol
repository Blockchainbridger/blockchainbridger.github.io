// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract HashFunction{
    function Hash(
        string memory _text,
        uint _num,
        address _addr
    ) public  pure returns (bytes32){
       return  keccak256(abi.encodePacked(_text, _num, _addr));

    }
    function collision(string memory _text, string memory _anotherText)
    public 
    pure 
    returns(bytes32)
    {
        return keccak256(abi.encodePacked(_text,_anotherText)); 
    }

}
contract GuessTheMagicWord{
    bytes32 public answer =  0x889e5ea4bf6ac1a8daaf2396d53d0aa528357f17cce0b2fc39ce2890276a00ce;
    function guess(string memory _word) public view returns (bool){
        return keccak256(abi.encodePacked(_word)) == answer;

    }
}