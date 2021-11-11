// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract TicTacToken {
    string[9] public board;

    function getBoard() public view returns (string[9] memory) {
        return board;
    }

    function markSpace(uint256 _space, string calldata _mark) public {
        require(_validMark(_mark), "Invalid Mark");
        require(_emptySpace(_space), "Already Marked");
        board[_space] = _mark;
    }

    function _emptySpace(uint256 _space) internal view returns (bool) {
        return _compareString(board[_space], "");
    }

    function _validMark(string calldata _mark) internal pure returns (bool) {
        return _compareString(_mark, "X") || _compareString(_mark, "O");
    }

    function _compareString(string memory a, string memory b)
        internal
        pure
        returns (bool)
    {
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }
}
