//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract DVS1 {
    address public owner;

    //struct for proposal
    struct Proposal {
        string description;
        uint256 proposalId;
        uint256 voteCount;
        bool isOpen;
    }

    Proposal[] public proposals;

    constructor() {
        owner = msg.sender;
    }

    function createProposal(string memory _description) public {
        uint256 proposalId = proposals.length;

        proposals.push(Proposal({
            description: _description,
            proposalId: proposalId,
            voteCount: 0,
            isOpen: true
        }));

    }

    function getProposalInfo(uint256 _proposalId) public view returns(Proposal){
        return proposals[_proposalId];
    }
}