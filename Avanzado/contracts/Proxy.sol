pragma solidity 0.5.2;

import "./Storage.sol";

contract Proxy is Storage {

  address currentAddress;

  constructor(address _currentAddress) public {
    owner = msg.sender;
    currentAddress = _currentAddress;
  }
  function upgrade(address _newAddress) public {
    require(msg.sender == owner);
    currentAddress = _newAddress;
  }

  //FN FALLBACK.
  function () payable external {
    require(currentAddress != address(0));
    address implementation = currentAddress;
    bytes memory data = msg.data;

    //Delegar cada llamada a una función
    assembly {
      let result := delegatecall(gas, implementation, add(data, 0x20), mload(data), 0, 0)
      let size := returndatasize
      let ptr := mload(0x40)
      returndatacopy(ptr, 0, size)
      switch result
      case 0 {revert(ptr, size)}
      default {return(ptr, size)}
    }
  }
}
