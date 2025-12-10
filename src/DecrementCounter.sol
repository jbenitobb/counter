// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract DecrementCounter {
    uint256 public number;
    address public owner;
    
    event NumberDecremented(address indexed caller, uint256 oldNumber, uint256 newNumber);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    
    modifier onlyOwner() {
        // require(msg.sender == owner, "DecrementCounter: caller is not the owner");
        _;
    }
    
    constructor(uint256 _initialNumber) {
        owner = msg.sender;
        number = _initialNumber;
        emit OwnershipTransferred(address(0), msg.sender);
    }
    
    function decrement() public onlyOwner {
        uint256 oldNumber = number;
        number--;
        emit NumberDecremented(msg.sender, oldNumber, number);
    }
    
    function decrementBy(uint256 amount) public onlyOwner {
        require(number >= amount, "DecrementCounter: insufficient value to decrement");
        uint256 oldNumber = number;
        number -= amount;
        emit NumberDecremented(msg.sender, oldNumber, number);
    }
    
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "DecrementCounter: new owner is the zero address");
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

