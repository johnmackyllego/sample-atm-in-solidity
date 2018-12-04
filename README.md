# sample-atm-in-solidity
The simplest way to implement the best practices in Security Restriction in Design Patterns.

Visit ```remix.ethereum.org``` to compile.

<br />

## Functions
```deposit()``` - Deposits the Eth to the balance, requires the msg.value to deposit. <br />
```balance()``` - Checks the current balance of the account. <br />
```withdraw(uint _amount)``` - Withdraw Eth. <br />
```stopContract()``` - Stop the contract. <br />
```resumeContract()``` - Resumes the contract, required when making ```deposit, withdraw, balance``` transactions.
