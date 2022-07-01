//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/07/01.
//

struct Bank: Agency {
    typealias T = BankCustomer
    var customerQueue: Queue<BankCustomer>
    var banker = Banker()
    var customerCount: Int?
    
    mutating func generateEmployee(numberOfBankers: Int) {
        
    }
    
    mutating func openAgency() {
        customerCount = customerQueue.count
        for _ in customerQueue {
            guard let currentCustomer = customerQueue.dequeue() else { return }
            banker.startWork(of: currentCustomer)
            banker.finishWork(of: currentCustomer)
        }
    }
    
    mutating func closeAgency() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount ?? 0)명이며, 총 업무시간은 \(banker.totalWorkTime.formatDoubleToString())초입니다.")
    }
}
