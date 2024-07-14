//
//  Account.swift
//  BankAccountOperations
//
//  Created by Clark Adams on 6/27/24.
//

import Foundation

public class Account {
    public let accountNumber: Int
    private(set) var balance: Double {
        didSet {
            print("Balance for account \(accountNumber) updated to \(balance)")
        }
    }

    public init(accountNumber: Int, initialBalance: Double = 0.0) {
        self.accountNumber = accountNumber
        self.balance = initialBalance
    }
    
    public func deposit(amount: Double) {
        balance += amount
    }
    
    public func withdraw(amount: Double) -> Bool {
        if amount <= balance {
            balance -= amount
            return true
        } else {
            print("Insufficient funds in account \(accountNumber)")
            return false
        }
    }
}
