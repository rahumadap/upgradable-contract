pragma solidity 0.5.2;

import "./Tokens.sol";

contract TokensUpdated is Tokens {
    constructor() public {
        initialize(msg.sender);
    }

    function initialize(address _owner) public {
        require(!_initialized);
        owner = _owner;
        _initialized = true;
    }
}
