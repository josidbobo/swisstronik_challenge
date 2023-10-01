# Swisstronik - TechFiesta Developer Challenge

I approached the challenge by creating an Election Factory that produces Election contracts with customised TITLE, CANDIDATES, POSITIONS to aid flexibility, this way owner of the contract can deploy Election contracts for multiple elections with the same specification as regards PRIVATE state variables and security but different use cases.

The project is structured to aid the ease of viewing the contracts:

contracts
|_____
&ensp; election.sol
&ensp; electionAccessControl.sol
&ensp; electionFactory.sol
&ensp; IElectionFactory.sol

```electionAccessControl``` contains the access specifics for the owner - CHAIRMAN and the voters - VOTERS to ensure the functions are accessed by only the one authorised for each function. ```election``` is the main election function with all the functions needed to carry out a successfull election. ```IElectionFactory``` describes the standard for the Election factory which it inherits while the ```electionFactory``` is the mother of all election smartcontract, it deploys the election contracts with all the required specifications TITLE, NUMBER OF CANDIDATES, POSITIONS, TIME CREATED and other important details.


## Deployed Contract 
https://explorer-evm.testnet.swisstronik.com/tx/0xc6f9fc4bdfce253b9e26000b2426ebde49b1df040bd191fffd9e73a12a91dcfe
