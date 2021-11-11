// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./utils/TicTacTokenTest.sol";

contract TestTTT is TicTacTokenTest {
    function test_has_empty_board() public {
        for (uint256 i = 0; i < 9; i++) {
            assertEq(ttt.board(i), "");
        }
    }

    function test_get_board() public {
        string[9] memory expectedBoard = ["", "", "", "", "", "", "", "", ""];

        string[9] memory actualBoard = ttt.getBoard();

        for (uint256 i = 0; i < 9; i++) {
            assertEq(actualBoard[i], expectedBoard[i]);
        }
    }

    function test_can_mark_space_with_X(uint256 space) public {
        if (space > 8) return;
        ttt.markSpace(space, "X");

        assertEq(ttt.board(space), "X");
    }

    function test_can_mark_space_with_O(uint256 space) public {
        if (space > 8) return;
        ttt.markSpace(space, "O");

        assertEq(ttt.board(space), "O");
    }

    function testFail_cannot_mark_space_with_Z() public {
        ttt.markSpace(0, "Z");

        assertEq(ttt.board(0), "Z");
    }

    function testFail_cannot_overwrite_marked_space() public {
        ttt.markSpace(0, "X");
        ttt.markSpace(0, "O");
    }
}
