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
    private let customerQueue = DispatchQueue.init(label: "customer")
    
    // MARK: - init func
    init(bankerNumber: Int) {
        for number in 1...bankerNumber {
            bankers.append(Banker(number))
        }
        NotificationCenter.default.addObserver(self, selector: #selector(assignedCustomerToBanker(_:)), name: .finishBankerTask, object: nil)
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
        try initCustomers(customerNumber)
        openTime = Date()
        totalProcessedCustomersNumber = 0
        try work()
    }
    
    private func work() throws {
        for banker in self.bankers {
            if self.customers.isEmpty {
                break
            }
            totalProcessedCustomersNumber += 1
            banker.startWork(customer: self.customers.removeFirst(), group: self.bankGroup)
        }
        self.bankGroup.wait()
        try self.close()
    }
    
    @objc func assignedCustomerToBanker(_ notification: Notification) {
        guard let bankerIndex = notification.object as? Int else {
            return
        }
        customerQueue.async {
            if self.customers.isNotEmpty {
                self.totalProcessedCustomersNumber += 1
                self.bankers[bankerIndex - 1].startWork(customer: self.customers.removeFirst(), group: self.bankGroup)
            }
        }
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
