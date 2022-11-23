// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract CalldataEncoding {
    function hashStringWithAssembly(string calldata varName) public pure returns(bytes32 hash) {
        assembly {
            let lenLoc := calldataload(0x4)
            let len := calldataload(0x24)
            let ptr := mload(0x40)
            calldatacopy(ptr, add(0x24, 0x20), len)
            hash := keccak256(ptr, len)
        }
    }

    function hashStringWithSolidity(string calldata varName) public pure returns(bytes32 hash) {
        hash = keccak256(abi.encodePacked(varName));
    }
}