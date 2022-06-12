pragma solidity 0.8.14;
"SPDX-License-Identifier: <SPDX-License>"

import "./Storage.sol";

contract Tokens is Storage {

    function getNumTokens() public view returns(uint256) {
        return Storage.getNumber();
    }

    function setNumTokens(uint256 _tokens) public {
        Storage.setNumber(_tokens);
    }
}
