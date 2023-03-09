//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Whitelist {
    uint8 public maxWhitelistedAddresses;

    mapping(address => bool) public whitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddress) {
        maxWhitelistedAddresses = _maxWhitelistedAddress;
    }

    function addAddressToWhitelist() public {
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "can't add address, max limit of addresses is reached"
        );
        require(
            !whitelistedAddresses[msg.sender],
            "This address is already whitelisted"
        );

        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted++;
    }
}
