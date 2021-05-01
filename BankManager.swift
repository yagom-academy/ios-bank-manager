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
    
    init(bank: Bank, consoleViewer: ConsoleViewController, randomGenerator: RandomGenerator) {
        self.bank = bank
        self.consoleViewController = consoleViewer
        self.randomGenerator = randomGenerator
        bankOperationQueue.maxConcurrentOperationCount = bank.numberOfBankTeller
    }
    
    private func handleCustomer() {
        for _ in 1...randomGenerator.createRandomNumber() {
            let randomCustomer = randomGenerator.generateRandomCustomer(ticketNumber: bank.getNewTicketNumber())
            let operation = HandleCustomerOperation(customer: randomCustomer)
            bankOperationQueue.addOperation(operation)
        }
    }
    
    mutating func start() {
        while true {
            bankOperationQueue.addOperations([ConsoleTaskOperation(consoleViewController: consoleViewController)], waitUntilFinished: true)
            
            guard consoleViewController.shouldContinue else { return }
        
            bankOperationQueue.addOperations([BankTaskOperation(bank: bank, task: .openBank)], waitUntilFinished: true)
            
            handleCustomer()
            bankOperationQueue.waitUntilAllOperationsAreFinished()
            
            bankOperationQueue.addOperations([BankTaskOperation(bank: bank, task: .closeBank)], waitUntilFinished: true)
        }
    }
}
