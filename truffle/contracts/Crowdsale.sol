pragma solidity ^0.4.8;

import "./CoolICOToken.sol";
import "./InsuranceToken.sol";

contract Crowdsale {
	address public beneficiary;
	uint public fundingGoal;
	uint public amountRaised;
	uint public deadline;
	uint public price;
	CoolICOToken public tokenReward;
	InsuranceToken public tokenInsurer;
	mapping(address => uint256) public balanceOf;
	bool fundingGoalReached = false;
	event GoalReached(address beneficiary, uint amountRaised);
	event FundTransfer(address backer, uint amount, bool isContribution);
	bool crowdsaleClosed = false;

	/* data structure to hold information about campaign contributors */

	/*  at initialization, setup the owner */
	function Crowdsale(
//		address ifSuccessfulSendTo,
		uint fundingGoalInEthers,
		uint durationInMinutes,
		uint etherCostOfEachToken,
		InsuranceToken _tokenInsurer,
		CoolICOToken _tokenReward
	) {
//		beneficiary = ifSuccessfulSendTo;
		beneficiary = msg.sender;
		fundingGoal = fundingGoalInEthers * 1 ether;
		deadline = now + durationInMinutes * 1 minutes;
		price = etherCostOfEachToken * 1 ether;
		tokenInsurer = _tokenInsurer;
		tokenReward = _tokenReward;
	}

	/* The function without name is the default function that is called whenever anyone sends funds to a contract */
	function () payable {
		if (crowdsaleClosed) {
			throw;
		}
		uint totalAmount = msg.value;
		uint ratio = 10; // TODO should depend on ICO symbol
		uint beneficiaryAmount = totalAmount * (1 - ratio / 100);
		uint insurerAmount = totalAmount * ratio / 100;
		balanceOf[msg.sender] = beneficiaryAmount;
		amountRaised += beneficiaryAmount;
		tokenReward.transfer(msg.sender, totalAmount / price);
		tokenInsurer.transfer(msg.sender, totalAmount / price); // TODO
		address insurerAddr = tokenInsurer.owner();
		insurerAddr.transfer(insurerAmount); // send insurance payment to insurer
		FundTransfer(msg.sender, totalAmount, true);
	}

	modifier afterDeadline() {
		if (now >= deadline) {
			_;
		}
	}

	/* checks if the goal or time limit has been reached and ends the campaign */
	function checkGoalReached() afterDeadline {
		if (amountRaised >= fundingGoal){
			fundingGoalReached = true;
			GoalReached(beneficiary, amountRaised);
		}
		crowdsaleClosed = true;
	}


	function safeWithdrawal() afterDeadline {
		if (!fundingGoalReached) {
			uint amount = balanceOf[msg.sender];
			balanceOf[msg.sender] = 0;
			if (amount > 0) {
				if (msg.sender.send(amount)) {
					FundTransfer(msg.sender, amount, false);
				}
				else {
					balanceOf[msg.sender] = amount;
				}
			}
		}

		if (fundingGoalReached && beneficiary == msg.sender) {
			if (beneficiary.send(amountRaised)) {
				FundTransfer(beneficiary, amountRaised, false);
			}
			else {
				//If we fail to send the funds to beneficiary, unlock funders balance
				fundingGoalReached = false;
			}
		}
	}
}
