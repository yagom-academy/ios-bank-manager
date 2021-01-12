//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/04.
//

import Foundation

class Bank {
    private var customers: [Customer] = []
    private var bankers: [Banker] = []
    private var openTime: Date?
    private var totalProcessedCustomersNumber = 0
    private let bankGroup: DispatchGroup = DispatchGroup()
    private let closeMessage = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초입니다."
    
    // MARK: - init func
    init(bankerNumber: Int) {
        for number in 1...bankerNumber {
            bankers.append(Banker(number))
        }
    }
    
    func initBankers() {
        for banker in bankers {
            banker.isWorking = false
        }
    }
    
    func initCustomers(_ customerNumber: Int) throws {
        customers.removeAll()
        for number in 1...customerNumber {
            guard let randomGrade = Grade.allCases.randomElement(),
                  let randomTask = TaskType.allCases.randomElement() else {
                throw BankError.typeRandomElement
            }
            customers.append(Customer(waitingNumber: number, customerGrade: randomGrade, taskType: randomTask))
        }
        
        sortCustomers()
    }
    
    private func sortCustomers() {
        customers.sort(by: { (first, second) -> Bool in
            if first.customerGrade == second.customerGrade {
                return first.waitingNumber < second.waitingNumber
            }
            return first.customerGrade.gradePriority < second.customerGrade.gradePriority
        })
    }
    
    func open(_ customerNumber: Int) throws {
        initBankers()
        try initCustomers(customerNumber)
        openTime = Date()
        totalProcessedCustomersNumber = 0
        try work()
    }
    
    private func work() throws {
        while self.customers.isNotEmpty {
            for banker in self.bankers {
                if self.customers.isEmpty {
                    break
                }
                if !banker.isWorking{
                    totalProcessedCustomersNumber += 1
                    banker.startWork(customer: self.customers.removeFirst(), group: self.bankGroup)
                }
            }
        }
        self.bankGroup.wait()
        try self.close()
    }
    
    private func close() throws {
        guard let open = self.openTime else {
            throw BankError.close
        }
        let closeTime = Date()
        let totalTime = TimeInterval(closeTime.timeIntervalSince(open))
        print(String(format: closeMessage, self.totalProcessedCustomersNumber, totalTime))
    }
    
}
