//
//  Bank.swift
//  BankAccountOperations
//
//  Created by Clark Adams on 6/27/24.
//

import Foundation

public class Bank {
    private var accounts: [Int: Account] = [:]
    private var nextAccountNumber = 1
    
    public init() {}
    
    public func createAccount(initialBalance: Double = 0.0) -> Account {
        let account = Account(accountNumber: nextAccountNumber, initialBalance: initialBalance)
        accounts[nextAccountNumber] = account
        nextAccountNumber += 1
        return account
    }
    
    public func deleteAccount(accountNumber: Int) {
        if let removedAccount = accounts.removeValue(forKey: accountNumber) {
            print("Account \(removedAccount.accountNumber) deleted.")
        } else {
            print("Account with number \(accountNumber) not found.")
        }
    }
    
    public func deposit(to accountNumber: Int, amount: Double) {
        guard let account = accounts[accountNumber] else {
            print("Account with number \(accountNumber) not found")
            return
        }
        account.deposit(amount: amount)
        print("Account \(accountNumber) credited with \(amount). Current balance: \(account.balance)")
    }
    
    public func transfer(from fromAccountNumber: Int, to toAccountNumber: Int, amount: Double) {
        guard let fromAccount = accounts[fromAccountNumber] else {
            print("Sender account with number \(fromAccountNumber) not found")
            return
        }
        guard let toAccount = accounts[toAccountNumber] else {
            print("Receiver account with number \(toAccountNumber) not found")
            return
        }
        if fromAccount.withdraw(amount: amount) {
            toAccount.deposit(amount: amount)
            print("Transferred \(amount) from account \(fromAccountNumber) to account \(toAccountNumber)")
        }
    }
    
    public func mergeAccounts(fromAccount: Int, toAccount: Int) {
        guard let sourceAccount = accounts[fromAccount], let destinationAccount = accounts[toAccount] else {
            print("One or both accounts not found")
            return
        }
        destinationAccount.deposit(amount: sourceAccount.balance)
        deleteAccount(accountNumber: fromAccount)
        print("Account \(fromAccount) merged into account \(toAccount). New balance: \(destinationAccount.balance)")
    }
    
    public func printAccountInfo(accountNumber: Int) {
        guard let account = accounts[accountNumber] else {
            print("Account with number \(accountNumber) not found")
            return
        }
        print("Account \(accountNumber): balance \(account.balance)")
    }
    
    public func printAllAccounts() {
        for account in accounts.values {
            print("Account \(account.accountNumber): balance \(account.balance)")
        }
    }
    
    public lazy var accountDescriptions: [String] = {
        return accounts.values.map { "Account \($0.accountNumber): balance \($0.balance)" }
    }()
}
