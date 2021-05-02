//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bank: Bank
    private var consoleViewController: ConsoleViewController
    private let randomGenerator: RandomGenerator
    private let bankOperationQueue = OperationQueue()
    private var randomCustomers: [Customer]?
    
    init(bank: Bank, consoleViewer: ConsoleViewController, randomGenerator: RandomGenerator) {
        self.bank = bank
        self.consoleViewController = consoleViewer
        self.randomGenerator = randomGenerator
        bankOperationQueue.maxConcurrentOperationCount = bank.numberOfBankTeller
    }
    
    private mutating func createRandomCustomer() {
        randomCustomers = randomGenerator.generateRandomCustomer(bank: &bank)
    }
    
    private mutating func handleCustomer() throws {
        guard var randomCustomers = randomCustomers else { throw BankManagerError.failToGenerateRandomCustomers }
        
        randomCustomers.sort{ $0.priority > $1.priority }
        
        randomCustomers.forEach({
            let customerOperation = HandleCustomerOperation(customer: $0)
            bankOperationQueue.addOperation(customerOperation)
        })
        
        bankOperationQueue.waitUntilAllOperationsAreFinished()
    }
    
    mutating func start() {
        while true {
            createRandomCustomer()
            consoleViewController.showStartMenu()
            
            do {
                try consoleViewController.chooseStartOrEnd()
            } catch {
                print(error)
                continue
            }
            
            guard consoleViewController.shouldContinue else { return }
            
            bank.openBank()
            do {
                try handleCustomer()
                try bank.closeBank()
            } catch {
                print(error)
                continue
            }
            
        }
    }
}
