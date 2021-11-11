// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./utils/TicTacTokenTest.sol";

contract TestTTT is TicTacTokenTest {
    function test_has_empty_board() public {
        for (uint256 i = 0; i < 9; i++) {
            assertEq(ttt.board(i), 0);
        }
    }

    function test_get_board() public {
        uint256[9] memory expectedBoard = [uint256(0), 0, 0, 0, 0, 0, 0, 0, 0];

        uint256[9] memory actualBoard = ttt.getBoard();

        for (uint256 i = 0; i < 9; i++) {
            assertEq(actualBoard[i], expectedBoard[i]);
        }
    }
}
