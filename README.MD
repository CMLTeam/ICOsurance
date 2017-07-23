**Team name:** ICOsurance

**Team members:** 

- @xonixx - Vlad Gubarkov
- @justrocknrolla - Sasha Shchetynin
- @vgorin - Basil Gorin
- @lyapen - Oleksii Potapenko

**Team leader:** @xonixx

**What problem are you trying to solve?**

_The project is aimed to provide the insurance solution to ICO investors against possible losses due to cyber-attacks during the ICO process._
 
Nowadays lots of ICOs suffer from cyber-security attacks. To name a few during last days:
- Parity Multisig Wallet Hack that affected 3 ICOs ($30m investors' money loss)
- CoinDash crowdfunding hack ($7m of investors money went to attacker's wallet)

**Description**

In this project we introduce the notion of [Insurance Token](https://github.com/CMLTeam/ICOsurance/blob/master/truffle/contracts/InsuranceToken.sol).
This is a token which will accompany the [usual ICO token](https://github.com/CMLTeam/ICOsurance/blob/master/truffle/contracts/CoolICOToken.sol) and will be issued during crowdfunding.  

The Insurance Token will be issued by Insurance Company to any company doing ICO that wish to use it.

Insurance company will engage security auditors to validate the source code of token contract (and all supplementary code) prior to the ICO event.
The insurance agreement being settled as a result will include the insurance payment rate.
The insurance payment rate will be the higher - the higher complexity and size of ICO/token code.

The whole essence of using this project is that the ICO company during the crowdfunding process will implicitly issue to investor 
the insurance token for every sold ICO token in some proportion (agreed with Insurance Company).

These Insurance tokens being ERC20-compatible will be visible in User's wallet but are not intended to be transferred/traded and will be essentially locked.

In case of disaster event happens (ex.: ICO loses substantial amount of money due to being hacked) the Insurer will conduct 
Claim investigation. If/when the Claim is confirmed the Insurer [unlocks](https://github.com/CMLTeam/ICOsurance/blob/master/truffle/contracts/InsuranceToken.sol#L101) 
the Insurance Token for the suffered ICO, token gets released to be reimbursed.
Now the ICO Investor can return the Insurance token back to contract address and gets back the whole body of his investment in ETH.

We hope that only small fraction of ICO participating in the insurance pool really suffer from the cyber-attack and so it will be enough money to fulfill all potential claims.

_What this project IS NOT_

- This is not an insurance to the possible loss due to market price changes (volatility)
- This is not an insurance against fraud/scam ICOs. It's responsibility of an investor to properly assess a project to invest in.

**Why do you think Blockchain/SmartContract may be the right approach?**
- [Eating your own dog food](https://en.wikipedia.org/wiki/Eating_your_own_dog_food) - use blockchain itself to protect blockchain
- all the logic is implemented as smart contract and operates on crypto-currency only (no fiat) so no risks due to volatility involved

**API/DATA/Gadget you are thinking about using:** 
Ethereum, [ERC20](https://theethereum.wiki/w/index.php/ERC20_Token_Standard), mock data (real data in future).

**What area do you need help on?:**
Insurance specialists
