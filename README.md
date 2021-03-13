# LotteryContract

## Goal 

Our goal for the project was to use solidity to build a smart contract to create an interactive lottery.  We wanted to encourage particiaption in our final presentation by having members of class 'buy' a lottery ticket, while the smart contract would pick a random winner and distribute the winnings.  

## Objectives 

We wanted to create a smart contract using solidity in remix that did the following: 

1. Allow participants from multiple addresses to purchase lottery tickets for pre-determined price in Ethereum 
2. Pool the earnings from the purchase of lottery tickets 
3. Select a randomized winner from the group of lottery participants. 
4. Pay out the pooled earnings from the lottery to the selected winner by sending the winnings to their wallet address 

## Plan of Action and Coding 

We began by researching different approaches to a lottery system using a solidity smart contract. After researching different methods, we created a smart contract with the following functionality: 

- A constructor sets up the token on the Ethereum network. 
- An array called tickets that stores the addresses of the ticket purchasers. The index of each address in the array is the lottery ticket number.   
- The Buy function sets the purchase price for each lottery ticket and then push the address of each ticket purchaser into the array. 
- To select a winner, the contract generates a random number by taking the current block number, subtracting 1 and running it through the block hash function to get a number which we converted to an integer. This integer is multiplied by the ticket count to ensure that it falls within the range of the number of tickets purchased, and determines the winner from the array.  
- Once a winner is chosen, all of the lottery proceeds are assigned to the address corresponding to the lottery winner.  
- The withdraw function verifies that the address of the person trying to withdraw funds matches the winner, allows them to withdraw their winnings in ether, and then resets their balance to 0 so they can't withdraw more than once.  
- The code then resets the the ticket count and winnings to zero, and resets/clears the array to start the lottery over again. 

## Testing 

Once we developed the lottery contract we tested the contract among our group to make sure it works.  We performed this testing in two phases

Phase 1: For our first phase of testing, we had a single person purchase multiple lottery tickets from multiple accounts, to test if the contract would select a random winner from the addresses providers. Once we verified this worked, we moved to phase 2. 

Phase 2:  For our second phase of testing, we expanded the lottery to our entire group to test the lottery with several different individuals buying lottery tickets. To do this, we each had to import the contract. 
(Include additioanl details on this process here)

## Challenges 

The primary challenge in developing a lottery system was to find a way to randomly pick a winner. Solidity is not capable of generating random numbers, and so we researched several already established methods annd tested several different ways to solve this problem, including a newly developed random number generator from Chainlink VRF. 

(include additional information on challenges and other methods reviewed here) 
