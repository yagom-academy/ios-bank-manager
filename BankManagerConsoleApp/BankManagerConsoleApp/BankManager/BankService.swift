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
                    print(BankManagerNameSpace.startBankingService)
                    print(Date())
                    processBankWork()
                    print(Date())
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
                let startTask = bankingServiceStartTask(currentCustomer)
                bankingServiceEndTask(currentCustomer, startTask: startTask)
            } else {
                break
            }
        }
        
        depositBankerQueue.waitUntilAllOperationsAreFinished()
        loanBankerQueue.waitUntilAllOperationsAreFinished()
        
        do {
            let workTime = try bankingServiceTimeConverter(bankingServiceTime)
            
            print(String(format: BankManagerNameSpace.summaryTaskMessage, arguments: ["\(customerCount)","\(workTime)"]))
            bankingServiceTime = 0.0
            generateCustomerQueue()
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
    }
    
    private mutating func bankingServiceStartTask(_ customer: Customer) -> BlockOperation {
        let startTask = BlockOperation {
            print(String(format: BankManagerNameSpace.startTaskMessage, arguments: ["\(customer.waitingNumber)", "\(customer.bankingWork.financialProductsName)"]))
            Thread.sleep(forTimeInterval: customer.bankingWork.duration)
        }
        
        switch customer.bankingWork {
        case .deposit:
            depositBankerQueue.addOperation(startTask)
        case .loan:
            loanBankerQueue.addOperation(startTask)
        }
        
        return startTask
    }
    
    private mutating func bankingServiceEndTask(_ customer: Customer, startTask: BlockOperation) {
        let endTask = BlockOperation {
            print(String(format: BankManagerNameSpace.endTaskMessage, arguments: ["\(customer.waitingNumber)", "\(customer.bankingWork.financialProductsName)"]))
        }
        endTask.addDependency(startTask)
        
        switch customer.bankingWork {
        case .deposit:
            depositBankerQueue.addOperation(endTask)
        case .loan:
            loanBankerQueue.addOperation(endTask)
        }
        bankingServiceTime += customer.bankingWork.duration
    }
}
