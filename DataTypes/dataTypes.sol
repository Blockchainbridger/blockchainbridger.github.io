//SPDX-License-Identifier:MIT
pragma solidity^0.8;

contract DataTypes{

    bool public hey;
    bool public no = true;

    //uint stands for unassigned integer, non-negative

    //uint8 // range 0 - 2 ** 8 - 1 // 255
    //uint16 // range 0 - 2 ** 16 - 1 // 65535
    //uint256 //  range 0 - 2 ** 256 - 1 // 1.1579209e+77

    uint8 public u8 = 1;
    uint public u256 = 456;
    uint public u = 123;
    //Negative number

    int8 public i8 = -1;
    int public i256 = 456;
    int public i = 1234567777777777777777777777;

    //min max

    int public minInt = type(int).min;
    int public maxInt = type(int).max;
}