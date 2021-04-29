//
//  Operations.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/04/29.
//

import Foundation

class HandleCustomerOperation: Operation {
    let customer: Customer
    override func main() {
        handleBanking(customer: customer)
    }
    
    func handleBanking(customer: Customer) {
        print("\(customer.ticketNumber)번 고객 업무 시작")
        usleep(700000)
        print("\(customer.ticketNumber)번 고객 업무 완료")
    }
    
    init(customer: Customer) {
        self.customer = customer
        super.init()
    }
}

class BankTaskOperation: Operation {
    enum Task {
        case openBank
        case closeBank
    }
    
    var bank: Bank
    let task: Task
    
    init(bank: Bank, task: Task) {
        self.bank = bank
        self.task = task
    }
    
    override func main() {
        switch task {
        case .openBank:
            bank.openBank()
        case .closeBank:
            bank.closeBank()
        }
    }
}

class ConsoleTaskOperation: Operation {
    var consoleViewController: ConsoleViewController
    
    init(consoleViewController: ConsoleViewController) {
        self.consoleViewController = consoleViewController
    }
    
    override func main() {
        consoleViewController.showStartMenu()
        consoleViewController.getUserInput()
    }
    
}
