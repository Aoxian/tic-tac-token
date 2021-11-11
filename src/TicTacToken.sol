// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract TicTacToken {
    uint256[9] public board;

    function getBoard() public view returns (uint256[9] memory) {
        return board;
    }
}
