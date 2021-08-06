//
//  BankingDepartment.swift
//  BankManagerConsoleApp
//
//  Created by JINHONG AN on 2021/08/05.
//

import Foundation

class BankingDepartment {
    let duty: BankingCategory
    var customerQueue = Queue<Customer>()
    let semaphore: DispatchSemaphore
    let taskGroup: DispatchGroup
    let dispatchQueueForSemaphore = DispatchQueue(label: "semaphore")
    
    init(duty: BankingCategory, numberOfBankTellers: Int, taskGroup: DispatchGroup) {
        self.duty = duty
        semaphore = DispatchSemaphore(value: numberOfBankTellers)
        self.taskGroup = taskGroup
    }
    
    func receive(customer: Customer) {
        customerQueue.enqueue(customer)
    }
    
    func serveCustomers() {
        while let currentCustomer = customerQueue.dequeue() {
            semaphore.wait()
            taskGroup.enter()
            DispatchQueue.global().async {
                self.serve(customer: currentCustomer)
                self.semaphore.signal()
                self.taskGroup.leave()
            }
        }
    }
    
    func serve(customer: Customer) {
        print("\(customer.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: customer.desiredTask.timeRequired)
        print("\(customer.waitingNumber)번 고객 업무 완료")
    }
}
