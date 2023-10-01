// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

interface IElectionFactory {
    function updateElectionStatus(uint256 _electionId, string memory _status) external;
}