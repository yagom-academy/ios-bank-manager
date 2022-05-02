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
        guard let taskTime = sortTaskTime(customer) else { return }
        
        startTask(customer)
        taskGroup.enter()
        taskQueue.asyncAfter(deadline: .now() + taskTime) {
            finishTask(customer)
            taskGroup.leave()
        }
        taskGroup.wait()
    }
    
    private func sortTaskTime(_ customer: Customer) -> Double? {
        guard let task = customer.task else { return nil }
        
        switch task {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
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
