// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./utils/TicTacTokenTest.sol";

contract TestTTT is TicTacTokenTest {
    uint256 internal EMPTY;
    uint256 internal X;
    uint256 internal O;

    function setUp() public override {
        super.setUp();
        EMPTY = ttt.EMPTY();
        X = ttt.X();
        O = ttt.O();
    }

    function test_has_empty_board() public {
        for (uint256 i = 0; i < 9; i++) {
            assertEq(ttt.board(i), EMPTY);
        }
    }

    function test_get_board() public {
        uint256[9] memory expectedBoard = [
            EMPTY,
            EMPTY,
            EMPTY,
            EMPTY,
            EMPTY,
            EMPTY,
            EMPTY,
            EMPTY,
            EMPTY
        ];

        uint256[9] memory actualBoard = ttt.getBoard();

        for (uint256 i = 0; i < 9; i++) {
            assertEq(actualBoard[i], expectedBoard[i]);
        }
    }

    function test_can_mark_space_with_X(uint256 space) public {
        if (space > 8) return;
        uint256 piece = ttt.currentTurn();
        ttt.markSpace(space, piece);

        assertEq(ttt.board(space), piece);
    }

    function test_can_mark_space_with_O(uint256 space) public {
        if (space > 8) return;
        uint256 piece = ttt.currentTurn();
        ttt.markSpace(space, piece);

        assertEq(ttt.board(space), piece);
    }

    function testFail_cannot_mark_space_with_other_symbol() public {
        ttt.markSpace(0, 3);

        assertEq(ttt.board(0), 3);
    }

    function testFail_cannot_overwrite_marked_space() public {
        ttt.markSpace(0, X);
        ttt.markSpace(0, O);
    }

    function testFail_cannot_mark_same_piece_twice() public {
        ttt.markSpace(1, X);
        ttt.markSpace(2, X);
    }

    function test_tracks_current_turn() public {
        assertEq(ttt.currentTurn(), X);
        ttt.markSpace(1, X);
        assertEq(ttt.currentTurn(), O);
        ttt.markSpace(2, O);
        assertEq(ttt.currentTurn(), X);
    }

    function testFail_checks_valid_space() public {
        ttt.markSpace(10, X);
    }

    function test_checks_for_horizontal_win() public {
        ttt.markSpace(0, X);
        ttt.markSpace(3, O);
        ttt.markSpace(1, X);
        ttt.markSpace(4, O);
        ttt.markSpace(2, X);
        assertEq(ttt.winner(), X);
    }

    function test_checks_for_vertical_win() public {
        ttt.markSpace(1, X);
        ttt.markSpace(0, O);
        ttt.markSpace(2, X);
        ttt.markSpace(3, O);
        ttt.markSpace(4, X);
        ttt.markSpace(6, O);
        assertEq(ttt.winner(), O);
    }

    function test_checks_for_diagonal_win() public {
        ttt.markSpace(0, X);
        ttt.markSpace(1, O);
        ttt.markSpace(4, X);
        ttt.markSpace(5, O);
        ttt.markSpace(8, X);
        assertEq(ttt.winner(), X);
    }

    function test_checks_for_antidiagonal_win() public {
        ttt.markSpace(1, X);
        ttt.markSpace(2, O);
        ttt.markSpace(3, X);
        ttt.markSpace(4, O);
        ttt.markSpace(5, X);
        ttt.markSpace(6, O);
        assertEq(ttt.winner(), O);
    }
}
