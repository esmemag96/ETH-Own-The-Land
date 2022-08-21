// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract NumberBox {
    uint256 number;
    
    constructor(uint256 startNumber) {
        number = startNumber;
    }
    function update (uint256 _newNumber) public {
        number = _newNumber;
    }
    function read () public view returns (uint256) {
        return number;
    }
}