pragma solidity 0.8.14;
"SPDX-License-Identifier: <SPDX-License>"
//Sólo estructura
contract Storage {
    uint256 number;

    function getNumber() internal view returns (uint){
        return number;
    }

    function setNumber(uint256 _number) internal{
        number = _number;
    }
}
