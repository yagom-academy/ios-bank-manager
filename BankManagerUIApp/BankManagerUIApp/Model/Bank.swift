//
//  Bank.swift
//  BankManagerUIApp
//
//  Created by 박세웅 on 2022/05/05.
//

import Foundation

protocol SendDelegate {
    func addToWaitingList(_ customer: Customer)
    func addToWorkingList(_ customer: Customer)
    func removeFromWorkingList(_ customer: Customer)
}

struct Bank {
    private var numberOfCustomer: Int
    private let customerQueue: Queue = Queue<Customer>()
    private let teller: Teller = Teller()
    private let depositWindow: DispatchSemaphore = DispatchSemaphore(value: NumberOfTask.deposit)
    private let loanWindow: DispatchSemaphore = DispatchSemaphore(value: NumberOfTask.loan)
    private let bankingGroup = DispatchGroup()
    private let bankingQueue = DispatchQueue(label: "bankingQueue", attributes: .concurrent)
    var delegate: SendDelegate?
    
    init(numberOfCustomer: Int) {
        self.numberOfCustomer = numberOfCustomer
    }

    mutating func setUpCustomer(number: Int) {
        self.numberOfCustomer = number
        addCustomerInLine()
    }

    private func addCustomerInLine() {
        for number in 1...numberOfCustomer {
            let customer = Customer(number)
            delegate?.addToWaitingList(customer)
            customerQueue.enqueue(customer)
        }
    }

    func work() {
        let startTime = CFAbsoluteTimeGetCurrent()

        while !customerQueue.isEmpty {
            guard let customer = customerQueue.dequeue() else {
                return
            }
            
            delegate?.addToWorkingList(customer)
            makeTellerWorkByTask(for: customer)
        }

        bankingGroup.wait()
        let endTime = CFAbsoluteTimeGetCurrent()
        closeBanking(from: startTime, to: endTime)
    }

    private func makeTellerWorkByTask(for customer: Customer) {
        guard let task = customer.bankingType else {
            return
        }
                
        bankingQueue.sync {
            switch task {
            case .deposit:
                depositWindow.wait()
                bankingQueue.async(group: bankingGroup) {
                    teller.work(for: customer)
                    depositWindow.signal()
                }
            case .loan:
                loanWindow.wait()
                bankingQueue.async(group: bankingGroup) {
                    teller.work(for: customer)
                    loanWindow.signal()
                }
            }
            delegate?.removeFromWorkingList(customer)
        }
    }

    private func closeBanking(from startTime: CFAbsoluteTime, to endTime: CFAbsoluteTime) {
        let totalWorkTime = String(format: "%.2f", endTime - startTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(totalWorkTime)초입니다.")
    }
}
