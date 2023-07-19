//
//  BankService.swift
//  BankManagerConsoleApp
//
//  Created by Kobe, Hemg on 2023/07/14.
//

import Foundation

struct BankService {
    private var customerQueue: CustomerQueue
    
    init(numberOfCustomers: Int) {
        self.customerQueue = CustomerQueue()
        generateCustomerQueue(numberOfCustomers)
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
        let banker = Banker(numberOfBankers: 1)
        let customerCount = customerQueue.count
        let sleepTime = TimeInterval(0.7)
        
        let workTime = timeCheck {
            while !customerQueue.isEmpty {
                guard let currentCustomer = customerQueue.dequeue() else { return }
                
                print("\(currentCustomer.user)번 고객 업무 시작")
                Thread.sleep(forTimeInterval: sleepTime)
                banker.processBankerTask(customer: currentCustomer)
            }
        }
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(workTime)초입니다.")
    }
    
    private mutating func generateCustomerQueue(_ numberOfCustomers: Int) {
        for i in 1...numberOfCustomers {
            let customer = Customer(waitingNumber: i)
            customerQueue.enqueue(customer: customer)
        }
        print(BankManagerNameSpace.startBankingService)
    }
}
