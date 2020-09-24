// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 < 0.8.0;

contract B {
    struct DataStorage {
        uint val;
    }

    function set(bytes32 ptr, uint _val) external {
        DataStorage storage ds;
        assembly { ds.slot := ptr }
        
        ds.val = _val;
    }

    function get(bytes32 ptr) external view returns(uint) {
        DataStorage storage ds;
        assembly { ds.slot := ptr }
        
        return ds.val;
    }
}