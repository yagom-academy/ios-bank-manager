//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Donnie, Safari on 2022/04/27.
//

import Foundation

struct BankClerk {
    let taskQueue = DispatchQueue(label: "taskQueue")
    let taskGroup = DispatchGroup()
    
    func processTask(for customer: Customer) {
        startTask(customer)
        taskGroup.enter()
        taskQueue.asyncAfter(deadline: .now() + 0.7) {
            finishTask(customer)
            taskGroup.leave()
        }
        taskGroup.wait()
    }
    
    private func startTask(_ customer: Customer) {
        print("\(customer.numberTicket)번 고객 업무 시작")
    }
    
    private func finishTask(_ customer: Customer) {
        print("\(customer.numberTicket)번 고객 업무 완료")
    }
}
