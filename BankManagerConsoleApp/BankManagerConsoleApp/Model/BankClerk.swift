//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 조민호 on 2022/04/27.
//

import Foundation

final class BankClerk: Presentable {
    private let name: String
    private let service: BankService
    
    init(name: String, service: BankService) {
        self.name = name
        self.service = service
    }
    
    func work(_ queue: Queue<Client>) {
        let workQueue = DispatchQueue(label: name)
        let workItem = createWorkItem(queue)
        
        while queue.isEmpty == false {
            workQueue.sync(execute: workItem)
        }
    }
    
    private func createWorkItem(_ queue: Queue<Client>) -> DispatchWorkItem {
        DispatchWorkItem {
            guard let client = queue.peek else {
                return
            }
            
            self.printStartTaskMessage(waitingNumber: client.waitingNumber)
            Thread.sleep(forTimeInterval: self.service.requiredTime)
            self.printFinishTaskMessage(waitingNumber: client.waitingNumber)
            
            queue.dequeue()
        }
    }
}
