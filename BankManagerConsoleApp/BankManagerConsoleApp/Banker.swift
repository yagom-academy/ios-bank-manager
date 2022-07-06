//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/07/01.
//

import Foundation

struct Banker: Workable {
    var task: Task?
    var workTime: Double

    init() {
        self.workTime = 0.0
    }
    
    init(task: Task) {
        self.workTime = 0.0
        self.task = task
    }
    
    func startWork(of customer: BankCustomer) {
        printStartWork(of: customer)
        switch self.task {
        case .deposit:
            Thread.sleep(forTimeInterval: Task.deposit.workTime)
//            self.workTime += Task.deposit.workTime
        case .loan:
            Thread.sleep(forTimeInterval: Task.loan.workTime)
//            self.workTime += Task.loan.workTime
        case .none:
            break
        }
        finishWork(of: customer)
    }
    
     func finishWork(of customer: BankCustomer) {
        printFinishWork(of: customer)
    }
    
     func printStartWork(of customer: BankCustomer) {
        guard let task = customer.task else { return }
        print("\(customer.id)번 고객 \(task) 업무 시작")
    }
    
    private func printFinishWork(of customer: BankCustomer) {
        guard let task = customer.task else { return }
        print("\(customer.id)번 고객 \(task) 업무 완료")
    }
}
