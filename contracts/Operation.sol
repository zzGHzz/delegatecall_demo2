// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 < 0.8.0;

contract Operation {
    struct Object {
        uint val;
    }

    function set(bytes32 ptr, uint _val) external {
        Object storage ds;
        assembly { ds.slot := ptr }
        
        ds.val = _val;
    }

    function get(bytes32 ptr) external view returns(uint) {
        Object storage ds;
        assembly { ds.slot := ptr }
        
        return ds.val;
    }
}