/*
    The simplest way to implement the Design Patterns Security Restrictions
    Author: LLEGO, JOHN MACHY R.

    Referenced from: ConsenSys Presentation, ConsenSys, Inc (2018)
*/
pragma solidity ^0.4.24;

contract Atm{
    
    // access restriction
    address owner;
    
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
        require(isStopped==false);
        balances[msg.sender] = msg.value;
    }
    
    function balance() onlyOwner public view returns (uint) {
        require(isStopped==false);
        return balances[msg.sender];
    }
    
    // checks effects interactions, guard check, pull over push, secure ether transfer
    function withdraw(uint amount) onlyOwner public {
        require(balances[msg.sender] >= amount && isStopped==false);
        balances[msg.sender] -= amount;
        msg.sender.transfer(amount);
    }
    
    //emergency stop
    function stopContract() onlyOwner public {
        isStopped = true;
    }
    
    //emergency stop
    function resumeContract()  onlyOwner public {
        isStopped = false;
    }
}