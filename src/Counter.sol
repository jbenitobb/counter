// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;
    address public owner;
    
    event NumberSet(address indexed setter, uint256 oldNumber, uint256 newNumber);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    
    modifier onlyOwner() {
        // require(msg.sender == owner, "Counter: caller is not the owner");
        _;
    }
    
    constructor() {
        owner = msg.sender;
        emit OwnershipTransferred(address(0), msg.sender);
    }

    function setNumber(uint256 newNumber) public onlyOwner {
        uint256 oldNumber = number;
        number = newNumber;
        emit NumberSet(msg.sender, oldNumber, newNumber);
    }

    function increment() public {
        number++;
    }
    
    function transferOwnership(address newOwner) public onlyOwner {
        // require(newOwner != address(0), "Counter: new owner is the zero address");
        address oldOwner = owner;
        owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
    
    function renounceOwnership() public onlyOwner {
        address oldOwner = owner;
        owner = address(0);
        emit OwnershipTransferred(oldOwner, address(0));
    }
}
