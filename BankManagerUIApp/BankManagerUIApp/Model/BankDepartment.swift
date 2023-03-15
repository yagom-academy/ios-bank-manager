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
    private let workableBanker: DispatchSemaphore
    private let taskQueue: DispatchQueue = DispatchQueue(label: "taskQueue", attributes: .concurrent)
    var tasks: [DispatchWorkItem] = []
    
    init(workableBankerCount: Int) {
        self.workableBanker = DispatchSemaphore(value: workableBankerCount)
    }
    
    func respond(to customer: Customer) {
        let task = makeTask(for: customer)
        guard task.isCancelled == false else { return }
        taskQueue.async(execute: task)
        
    }
    
    private func makeTask(for customer: Customer) -> DispatchWorkItem {
        let task = DispatchWorkItem { [weak self] in
            self?.workableBanker.wait()
            self?.doWork(for: customer)
            self?.workableBanker.signal()
        }
        
        self.tasks.append(task)
        
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
        
        print(endMessage)
        
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .finished,
                                            object: nil,
                                            userInfo: [NotificationKey.finished: customer])
        }
    }
    
    func cancelTasks() {
        self.tasks.forEach {
            $0.cancel()
        }
    }
}
