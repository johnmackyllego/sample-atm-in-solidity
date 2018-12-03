/*
    Design Patterns Security Restrictions Examples
    Author: LLEGO, JOHN MACHY R.
*/
pragma solidity ^0.4.24;

contract Atm{
    
    // access restriction
    address public owner;
    
    // guard checks
    uint donate_amount = 2;
    
    //emergency stop
    bool isStopped = false;
    
    // checks effects interactions
    mapping(address => uint) balances;
    
    // access restriction
    constructor() payable public {
        owner = msg.sender;
    }
    
    // access restriction
    modifier onlyOwner {
        require(msg.sender==owner, "Not Authorized");
        _;
    }
    
    // checks effects interactions
    function deposit() onlyOwner public payable {
        balances[msg.sender] = msg.value;
    }
    
    // checks effects interactions, guard check, pull over push, secure ether transfer
    function withdraw(uint amount) onlyOwner public {
        require(balances[msg.sender] >= amount);
        balances[msg.sender] -= amount;
        msg.sender.transfer(amount);
    }
    
    //emergency stop
    function stopContract() public {
        require(msg.sender == owner);
        isStopped = true;
    }
    
    //emergency stop
    function resumeContract() public {
        require(msg.sender == owner);
        isStopped = false;
    }
}