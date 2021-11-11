// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./utils/TicTacTokenTest.sol";

contract TestTTT is TicTacTokenTest {
    function testNothing() public {
        assertEq(uint8(1), 1);
    }
}