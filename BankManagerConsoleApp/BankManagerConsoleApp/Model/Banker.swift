//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/07.
//

import Foundation

struct Banker {
    private let loanDepartment: DispatchSemaphore
    private let depositDepartment: DispatchSemaphore
    private let workQueue: DispatchQueue = DispatchQueue(label: "workQueue", attributes: .concurrent)
    private let workGroup: DispatchGroup = DispatchGroup()
    
    init(loanDepartment: Int, depositDepartment: Int) {
        self.loanDepartment = DispatchSemaphore(value: loanDepartment)
        self.depositDepartment = DispatchSemaphore(value: depositDepartment)
    }
    
    
    private func makeTask(for customer: Customer, Department: DispatchSemaphore) -> DispatchWorkItem {
        let task = DispatchWorkItem {
            Department.wait()
            doWork(for: customer)
            Department.signal()
        }
        
        return task
    }
    
    func respond(to customer: Customer) {
        guard let business = customer.business else { return }
        switch business {
        case .deposit:
            let bankerTask = makeTask(for: customer, Department: depositDepartment)
            workQueue.async(group: workGroup, execute: bankerTask)
        case .loan:
            let bankerTask = makeTask(for: customer, Department: loanDepartment)
            workQueue.async(group: workGroup, execute: bankerTask)
        }
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
