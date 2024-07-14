//
//  main.swift
//  BankAccountOperations
//
//  Created by Clark Adams on 6/27/24.
//

import Foundation

let bank = Bank()

// Creating accounts
let account1 = bank.createAccount(initialBalance: 100.0)
let account2 = bank.createAccount(initialBalance: 200.0)
let account3 = bank.createAccount(initialBalance: 300.0)

// Printing all accounts state before operations
print("State of accounts before operations:")
bank.printAllAccounts()

// Depositing to an account
bank.deposit(to: account1.accountNumber, amount: 50.0)

// Transferring funds between accounts
bank.transfer(from: account1.accountNumber, to: account2.accountNumber, amount: 30.0)

// Merging accounts
bank.mergeAccounts(fromAccount: account2.accountNumber, toAccount: account3.accountNumber)

// Printing info of a specific account
bank.printAccountInfo(accountNumber: account1.accountNumber)

// Deleting an account
bank.deleteAccount(accountNumber: account1.accountNumber)

// Printing all accounts state after operations
print("State of accounts after operations:")
bank.printAllAccounts()

// Accessing the lazy property
print("Account descriptions:")
print(bank.accountDescriptions)
