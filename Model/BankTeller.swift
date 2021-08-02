//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by Yongwoo Marco on 2021/07/31.
//

import Foundation

struct BankTeller: Taskable {
    let task: Task
    
    func serve(_ client: Client) {
        print("\(client.waitingNumber)번 고객 \(client.task.description) 업무 시작")
        
        Thread.sleep(forTimeInterval: task.taskTime)
        
        print("\(client.waitingNumber)번 고객 \(client.task.description) 업무 완료")
    }
}


//func serveCustomers() {
//        let semaphore = DispatchSemaphore(value: numberOfBankTellers)
//        let group = DispatchGroup()
//        while let currentCustomer = customerQueue.dequeue() {
//            semaphore.wait()
//            guard let bankTeller = bankTellerQueue.dequeue() else {
//                customerQueue.enqueue(currentCustomer)
//                semaphore.signal()
//                continue
//            }
//            group.enter()
//            DispatchQueue.global().async {
//                bankTeller.serve(customer: currentCustomer)
//                self.bankTellerQueue.enqueue(bankTeller)
//                semaphore.signal()
//                group.leave()
//            }
//        }
//        group.wait()
//}
