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
    let departmentGroup: DispatchGroup
    
    init(duty: BankingCategory, numberOfBankTellers: Int, departmentGroup: DispatchGroup) {
        self.duty = duty
        semaphore = DispatchSemaphore(value: numberOfBankTellers)
        self.departmentGroup = departmentGroup
    }
    
    func receive(customer: Customer) {
        customerQueue.enqueue(customer)
    }
    
    func serveCustomers() {
        let tellerGroup = DispatchGroup()
        while let currentCustomer = customerQueue.dequeue() {
            semaphore.wait()
            tellerGroup.enter()
            DispatchQueue.global().async {
                self.serve(customer: currentCustomer)
                self.semaphore.signal()
                tellerGroup.leave()
            }
        }
        tellerGroup.wait()
        departmentGroup.leave()
    }
    
    func serve(customer: Customer) {
        print("\(customer.waitingNumber)번 고객 \(customer.desiredTask)업무 시작")
        Thread.sleep(forTimeInterval: customer.desiredTask.timeRequired)
        print("\(customer.waitingNumber)번 고객 \(customer.desiredTask)업무 완료")
    }
}
