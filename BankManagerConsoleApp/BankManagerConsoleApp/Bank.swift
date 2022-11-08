//
//  Bank.swift
//  Created by sunnycookie, inho
//

import Foundation

struct Bank {
    private var customers: Queue<Customer> = Queue()
    private var completedCustomerCount: Int = 0
    private var bankClerks: [BankClerk]
    private var openingTime: Date?

    mutating func receive(customer: Customer) {
        customers.enqueue(customer)
    }
    
    init(bankClerks: [BankClerk]) {
        self.bankClerks = bankClerks
    }
    
    mutating func startBanking() {
        let group = DispatchGroup()
        var depositCustomers = Queue<Customer>()
        var loanCustomers = Queue<Customer>()
        openingTime = Date()
        
        while !customers.isEmpty {
            guard let customer = customers.dequeue() else {
                return
            }
            
            customer.bankingType == .deposit
                ? depositCustomers.enqueue(customer)
                : loanCustomers.enqueue(customer)
        }
        
        matchClerk(to: &depositCustomers, of: .deposit, group: group)
        matchClerk(to: &loanCustomers, of: .loan, group: group)
        group.wait()
        closeBanking()
    }
    
    mutating func matchClerk(to customers: inout Queue<Customer>,
                             of type: BankingType,
                             group: DispatchGroup) {
        let bankClerks = bankClerks.filter { $0.bankingType == type }
        
        while !customers.isEmpty {
            bankClerks.forEach { bankClerk in
                guard let customer = customers.dequeue() else {
                    return
                }
                
                bankClerk.serve(customer: customer, group: group)
                completedCustomerCount += 1
            }
        }
    }
    
    private func closeBanking() {
        guard let openingTime = openingTime else { return }
        
        let totalProcessingTime = String(format: Constant.twoDecimal,
                                         -openingTime.timeIntervalSinceNow)

        print(String(format: Constant.bankClosedMessage,
                     arguments: [completedCustomerCount, totalProcessingTime]))
    }
}

private extension Bank {
    enum Constant {
        static let twoDecimal: String = "%.2f"
        static let processingTime: Double = 0.7
        static let startMessage = "%d번 고객 업무 시작"
        static let endMessage = "%d번 고객 업무 종료"
        static let bankClosedMessage = "업무가 마감되었습니다. " +
                                       "오늘 업무를 처리한 고객은 총 %d명이며, " +
                                       "총 업무시간은 %@초입니다."
    }
}
