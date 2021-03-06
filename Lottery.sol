pragma solidity ^0.4.18;

contract Lottery {
    
    mapping (address => uint256) public winnings;
    address[] public tickets;
    
    string public name;
    string public symbol;
    uint256 public maxTickets;
    uint256 public remTickets;
    uint public ticketCount;
    uint256 public RandomNum;
    address public latestWinner;
    
    constructor(string tokenName, string tokenSymbol, uint maximumTickets, uint remainingTickets) public {
        
        name = tokenName;
        symbol = tokenSymbol;
        maxTickets = maximumTickets;
        remTickets = remainingTickets;
        
    }
    
    function Buy() public payable {
        
        require(msg.value == 1000000000000000000);
        
        uint256 val = msg.value / 1000000000000000000;
        
        require(remTickets - val < remTickets);
        remTickets -= val;
        
        tickets.push(msg.sender);
        ticketCount++;
    } 
    
    function Withdraw() public {
        require(winnings[msg.sender] > 0);
        
        uint256 amountToWithdraw = winnings[msg.sender];
        
        winnings[msg.sender] = 0;
        
        amountToWithdraw *= 1000000000000000000;
        
        msg.sender.transfer(amountToWithdraw);
    }
    
    function chooseWinner() public {
        require(ticketCount > 0);
        
        RandomNum = uint(blockhash(block.number -1)) % ticketCount;
        
        latestWinner = tickets[RandomNum];
        
        winnings[latestWinner] = ticketCount;
        ticketCount = 0;
        remTickets = maxTickets;
        
        delete tickets;
    }
}
