// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/CalldataEncoding.sol";

contract CalldataEncodingTest is Test {
    CalldataEncoding ce;
    function setUp() public {
       ce = new CalldataEncoding();
    }

    function testAssembly(string calldata varName) public {
        ce = new CalldataEncoding();
        bytes32 hash = ce.hashStringWithAssembly(varName);
        assertEq(hash, ce.hashStringWithSolidity(varName));
    }

    function testFunc(string calldata varName) public {
        ce = new CalldataEncoding();
        bytes32 hash = ce.hashStringWithSolidity(varName);
        assertEq(hash, ce.hashStringWithAssembly(varName));
    }
}
