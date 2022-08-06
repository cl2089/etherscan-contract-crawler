// SPDX-License-Identifier: MIT

pragma solidity >=0.7.6;

interface IWNative {
  function deposit() external payable;

  function withdraw(uint256 _amount) external;
}