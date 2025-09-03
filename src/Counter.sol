// SPDX-License-Identifier: UNLICENSED
    
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
        require(newOwner != address(0), "Counter: new owner is the zero address");
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
