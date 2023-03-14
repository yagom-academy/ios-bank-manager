//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/07.
//

import Foundation

struct Banker {
    private let workableBanker: DispatchSemaphore
    private let workQueue: DispatchQueue = DispatchQueue(label: "workQueue", attributes: .concurrent)
    
    init(department: DispatchSemaphore) {
        self.workableBanker = department
    }
    
    func respond(to customer: Customer, workGroup: DispatchGroup) {
        let task = makeTask(for: customer)
        workQueue.async(group: workGroup, execute: task)
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
