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
        guard let task = customer.task?.information else { return }
        print("\(customer.numberTicket)번 고객 \(task)업무 시작")
    }
    
    private func finishTask(_ customer: Customer) {
        guard let task = customer.task?.information else { return }
        print("\(customer.numberTicket)번 고객 \(task)업무 완료")
    }
}
