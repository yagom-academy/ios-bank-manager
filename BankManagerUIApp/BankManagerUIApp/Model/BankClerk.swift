//
//  BankClerk.swift
//  BankManagerUIApp
//
//  Created by Donnie, Safari on 2022/05/04.
//

import Foundation

struct BankClerk {
    private let taskQueue = DispatchQueue(label: "taskQueue")
    
    func processTask(for customer: Customer) {
        let taskGroup = DispatchGroup()
        guard let taskTime = sortTaskTime(customer) else { return }
        
        taskGroup.enter()
        taskQueue.asyncAfter(deadline: .now() + taskTime) {
            taskGroup.leave()
        }
        taskGroup.wait()
    }
    
    private func sortTaskTime(_ customer: Customer) -> Double? {
        guard let taskTime = customer.task?.time else { return nil }
        return taskTime
    }
}
