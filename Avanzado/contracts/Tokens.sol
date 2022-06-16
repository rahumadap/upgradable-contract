pragma solidity 0.5.2;

import "./Storage.sol";

contract Tokens is Storage {
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function getNumberOfTokens() public view returns (uint256) {
        return _uintStorage["Tokens"];
    }

    function setNumberOfTokens(uint256 toSet) public {
        _uintStorage["Tokens"] = toSet;
    }
}
