// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 < 0.8.0;

import "./B.sol";

contract A {
    struct DataStorage {
        uint val;
    }
    
    address delegate;
    bytes32[] ptrs;
    uint counter;

    constructor(address _delegate) {
        delegate = _delegate;
    }

    function newB() external {
        bytes32 ptr = keccak256(abi.encode(msg.sender, counter));
        ptrs.push(ptr);
        counter = counter + 1;

        emit NewB(msg.sender, ptr);
    }

    function set(uint i, uint val) external {
        (bool success, bytes memory result) 
            = delegate.delegatecall(abi.encodeWithSignature("set(bytes32,uint256)", ptrs[i], val));
        require(success, "delegatecall C.set(bytes32,uint256) failed");
    }

    function get(uint i) external returns(uint) {
        (bool success, bytes memory result) 
            = delegate.delegatecall(abi.encodeWithSignature("get(bytes32)", ptrs[i]));
        require(success, "delegatecall C.get(bytes32) failed");

        return abi.decode(result, (uint));
    }

    event NewB(address from, bytes32 ptr);
}