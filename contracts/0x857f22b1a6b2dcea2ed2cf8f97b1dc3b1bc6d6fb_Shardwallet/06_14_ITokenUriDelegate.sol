// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

interface ITokenUriDelegate {
    function tokenURI(uint256 tokenId) external view returns (string memory);
}