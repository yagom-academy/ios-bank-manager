//
//  Department.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/07.
//

import Foundation

struct BankDepartment {
    private let workableBanker: DispatchSemaphore
    private let taskQueue: DispatchQueue = DispatchQueue(label: "taskQueue", attributes: .concurrent)
    
    init(workableBankerCount: Int) {
        self.workableBanker = DispatchSemaphore(value: workableBankerCount)
    }
    
    func respond(to customer: Customer, workGroup: DispatchGroup) {
        let task = makeTask(for: customer)
        taskQueue.async(group: workGroup, execute: task)
    }
    
    private func makeTask(for customer: Customer) -> DispatchWorkItem {
        let task = DispatchWorkItem {
            self.workableBanker.wait()
            self.doWork(for: customer)
            self.workableBanker.signal()
        }
        
        return task
    }
    
    private func doWork(for customer: Customer) {
        guard let business = customer.business else { return }
        let startMessage = "\(customer.numberTicket)번 고객 \(business.rawValue)업무 시작"
        let endMessage = "\(customer.numberTicket)번 고객 \(business.rawValue)업무 완료"
        
        print(startMessage)
        Thread.sleep(forTimeInterval: business.processTime)
        print(endMessage)
    }
}
