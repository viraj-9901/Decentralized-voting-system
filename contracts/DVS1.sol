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
    mapping(address => bool) internal voters;

    constructor() {
        owner = msg.sender;
    }

    //function for create new proposal
    function createProposal(string memory _description) public {
        uint256 proposalId = proposals.length;

        proposals.push(Proposal({
            description: _description,
            proposalId: proposalId,
            voteCount: 0,
            isOpen: true
        }));

    }

    //function for getting proposal Information
    function getProposalInfo(uint256 _proposalId) public view returns(Proposal memory){
        return proposals[_proposalId];
    }

    //function for update proposal state
    function updateProposalState(uint256 _proposalId) public {
        require(owner == msg.sender, "Only owner can change/update the state.");
        proposals[_proposalId].isOpen = false;
    }

    //function for voter to cast their vote
    function castVote(uint256 _proposalId) public {
        require(voters[msg.sender] == false, "You already cast your vote");

        require(proposals[_proposalId].isOpen == true, "The proposal is not open any more.");

        proposals[_proposalId].voteCount ++;

        voters[msg.sender] = true;
    }

}