//
//  Department.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/07.
//

import Foundation

protocol Respondable {
    func respond(to customer: Customer)
    func cancelTasks()
}

final class BankDepartment: Respondable {
    private let operationQueue: OperationQueue = OperationQueue()
    
    init(workableBankerCount: Int) {
        operationQueue.maxConcurrentOperationCount = workableBankerCount
    }
    
    func respond(to customer: Customer) {
        let operation = makeTask(for: customer)
        operationQueue.addOperation(operation)
    }
    
    private func makeTask(for customer: Customer) -> BlockOperation {
        let task = BlockOperation {
            self.doWork(for: customer)
        }

        return task
    }
    
    private func doWork(for customer: Customer) {
        guard let business = customer.business else { return }
        let startMessage = "\(customer.numberTicket)번 고객 \(business.rawValue)업무 시작"
        let endMessage = "\(customer.numberTicket)번 고객 \(business.rawValue)업무 완료"
        
        print(startMessage)
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .working,
                                            object: nil,
                                            userInfo: [NotificationKey.working: customer])
        }
        
        Thread.sleep(forTimeInterval: business.processTime)
        
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .finished,
                                            object: nil,
                                            userInfo: [NotificationKey.finished: customer])
        }
        print(endMessage)
    }
    
    func cancelTasks() {
        operationQueue.cancelAllOperations()
    }
}
