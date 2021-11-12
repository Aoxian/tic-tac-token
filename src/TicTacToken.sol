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

    function winner() public view returns (uint256) {
        return _checkWins();
    }

    function _checkWins() internal view returns (uint256) {
        uint256[8] memory wins = [
            _row(0),
            _row(1),
            _row(2),
            _col(0),
            _col(1),
            _col(2),
            _diag(),
            _antiDiag()
        ];
        for (uint256 i = 0; i < wins.length; i++) {
            if (wins[i] == 1) {
                return X;
            } else if (wins[i] == 8) {
                return O;
            }
        }
        return 0;
    }

    function _row(uint256 row) internal view returns (uint256) {
        require(row <= 2, "Invalid Row");
        return board[row] * board[row + 1] * board[row + 2];
    }

    function _col(uint256 col) internal view returns (uint256) {
        require(col <= 2, "Invalid Row");
        return board[col] * board[col + 3] * board[col + 6];
    }

    function _diag() internal view returns (uint256) {
        return board[0] * board[4] * board[8];
    }

    function _antiDiag() internal view returns (uint256) {
        return board[2] * board[4] * board[6];
    }

    function _emptySpace(uint256 _space) internal view returns (bool) {
        return board[_space] == 0;
    }

    function _validMark(uint256 _mark) internal pure returns (bool) {
        return _mark == X || _mark == O;
    }
}
