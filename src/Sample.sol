// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CustomOwned {
    address public owner;
    uint256 private secretData;

    /**
     * @dev The constructor runs only once when the contract is deployed, 
     * setting the deployer's address as the initial owner.
     */
    constructor() {
        owner = msg.sender;
        emit OwnershipTransferred(address(0), msg.sender);
    }

    /**
     * @dev A modifier that restricts function access to the owner only.
     * The `require` statement checks if the caller is the owner.
     * The `_;` placeholder tells Solidity to execute the rest of the function body here.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _; // Executes the function body
    }

    /**
     * @dev Example function using the onlyOwner modifier.
     * Only the 'owner' address can call this function.
     */
    function updateSecretData(uint256 _newData) public onlyOwner {
        secretData = _newData;
    }

    /**
     * @dev A publicly accessible function to demonstrate different access levels.
     */
    function getSecretData() public view returns (uint256) {
        return secretData;
    }

    function transferOwnership(address newOwner) {
        // require(newOwner != address(0), "Counter: new owner is the zero address");
        address oldOwner = owner;
        owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
    
    function renounceOwnership() {
        address oldOwner = owner;
        owner = address(0);
        emit OwnershipTransferred(oldOwner, address(0));
    }
}
