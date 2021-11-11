// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract TicTacToken {
    uint256[9] public board;

    uint256 public constant EMPTY = 0;
    uint256 public constant X = 1;
    uint256 public constant O = 2;

    function getBoard() public view returns (uint256[9] memory) {
        return board;
    }

    function markSpace(uint256 _space, uint256 _mark) public {
        require(_validMark(_mark), "Invalid Mark");
        require(_emptySpace(_space), "Already Marked");
        board[_space] = _mark;
    }

    function _emptySpace(uint256 _space) internal view returns (bool) {
        return board[_space] == 0;
    }

    function _validMark(uint256 _mark) internal pure returns (bool) {
        return _mark == X || _mark == O;
    }
}
