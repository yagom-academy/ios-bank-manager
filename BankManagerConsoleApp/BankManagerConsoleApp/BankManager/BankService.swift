//
//  BankService.swift
//  BankManagerConsoleApp
//
//  Created by Kobe, Hemg on 2023/07/14.
//

import Foundation

struct BankService {
    private var customerQueue: CustomerQueue
    private var depositBankerQueue = OperationQueue()
    private var loanBankerQueue = OperationQueue()
    private var bankingServiceTime: Double = 0.0
    private var numberOfCustomers: Int
    
    init(numberOfCustomers: Int) {
        self.numberOfCustomers = numberOfCustomers
        self.customerQueue = CustomerQueue()
        generateCustomerQueue()
    }
    
    mutating func start() {
        var isExit: Bool = false
        
        while !isExit {
            do {
                printMenu()
                guard let input = readLine(),
                      let menuChoice = Int(input) else {
                    throw InputError.invalid
                }
                
                switch menuChoice {
                case 1:
                    processBankWork()
                case 2:
                    isExit = true
                default:
                    throw InputError.invalid
                }
            } catch let error as InputError {
                print(error.localized)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func printMenu() {
        print(BankManagerNameSpace.openBank,
              BankManagerNameSpace.closeBank,
              BankManagerNameSpace.userInput,
              separator: "\n",
              terminator: " ")
    }
    
    private mutating func processBankWork() {
        let customerCount = customerQueue.count
        depositBankerQueue.maxConcurrentOperationCount = 2
        loanBankerQueue.maxConcurrentOperationCount = 1
        
        while !customerQueue.isEmpty {
            if let currentCustomer = customerQueue.dequeue() {
                bankingServiceTask(currentCustomer)
            } else {
                break
            }
        }
        
        depositBankerQueue.waitUntilAllOperationsAreFinished()
        loanBankerQueue.waitUntilAllOperationsAreFinished()
        
        do {
            let workTime = try bankingServiceTimeConverter(bankingServiceTime)
            
            print(String(format: BankManagerNameSpace.summaryTaskMessage, arguments: ["\(customerCount)","\(workTime)"]))
            generateCustomerQueue()
            bankingServiceTime = 0.0
        } catch let error as NumberFormatError {
            print(error.localized)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private mutating func generateCustomerQueue() {
        for i in 1...numberOfCustomers {
            guard let bankingOperation = BankingOperations.allCases.randomElement() else {
                continue
            }
            
            let customer = Customer(waitingNumber: i, bankingWork: bankingOperation)
            customerQueue.enqueue(customer: customer)
        }
        print(BankManagerNameSpace.startBankingService)
    }
    
    private mutating func bankingServiceTask(_ customer: Customer) {
        let task = BlockOperation {
            print(String(format: BankManagerNameSpace.startTaskMessage, arguments: ["\(customer.waitingNumber)", "\(customer.bankingWork.financialProductsName)"]))
            print(String(format: BankManagerNameSpace.endTaskMessage, arguments: ["\(customer.waitingNumber)", "\(customer.bankingWork.financialProductsName)"]))
        }
        
        switch customer.bankingWork {
        case .deposit:
            depositBankerQueue.addOperation(task)
        case .loan:
            loanBankerQueue.addOperation(task)
        }
        
        bankingServiceTime += customer.bankingWork.duration
    }
}
