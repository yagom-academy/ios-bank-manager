//
//  BankClerk.swift
//  BankManagerUIApp
//
//  Created by Donnie, Safari on 2022/05/04.
//

import Foundation

protocol BankDelegate: AnyObject {
    func start()
    func finish()
}

struct BankClerk {
    private let taskQueue = DispatchQueue(label: "taskQueue")
    weak var delegate: BankDelegate?
    
    func processTask(for customer: Customer) {
        let taskGroup = DispatchGroup()
        guard let taskTime = sortTaskTime(customer) else { return }
        
        delegate?.start()
        taskGroup.enter()
        taskQueue.asyncAfter(deadline: .now() + taskTime) {
            delegate?.finish()
            taskGroup.leave()
        }
        taskGroup.wait()
    }
    
    private func sortTaskTime(_ customer: Customer) -> Double? {
        guard let taskTime = customer.task?.time else { return nil }
        return taskTime
    }
}
