pragma solidity 0.8.14;
"SPDX-License-Identifier: <SPDX-License>"

import "./Storage.sol";
//contiene fn llamando a Tokens.sol (current address) pero en el ámbito del Proxy
contract ProxyDog is Storage {

    address public currentAddress;

    constructor(address _currentAddress) public {
        currentAddress = _currentAddress;
    }

    function upgrade(address _currentAddress) public {
        currentAddress = _currentAddress;
    }

    function getNumberOfTokens() public returns (bool, bytes memory){
        (bool res, bytes memory data) = currentAddress.delegatecall(abi.encodePacked(bytes4(keccak256("getNumTokens()"))));
        return (res, data);
    }
    function setNumberOfTokens(uint256 _number) public returns (bool, bytes memory){
        (bool res, bytes memory data) = currentAddress.delegatecall(abi.encodePacked(bytes4(keccak256("setNumTokens(uint256)")), _number));
        return (res, data);
    }
}
