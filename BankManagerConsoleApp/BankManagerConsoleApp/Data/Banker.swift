//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/04.
//

import Foundation

class Banker {
    private let bankerNumber: Int
    private let workingQueue: DispatchQueue
    private let startTaskMessgae = "%d번 %@고객 %@업무 시작"
    private let endTaskMessgae = "%d번 %@고객 %@업무 완료"
    
    // MARK: - init func
    init(_ number: Int) {
        self.workingQueue = DispatchQueue(label: "\(number)")
        self.bankerNumber = number
    }
    
    func startWork(customer: Customer, group: DispatchGroup) {
        group.enter()
        print(String(format: startTaskMessgae, customer.waitingNumber, customer.grade.description, customer.taskType.description))
        workingQueue.asyncAfter(deadline: .now() + customer.taskType.time) {
            self.finishWork(customer: customer, group: group)
        }
    }
    
    private func finishWork(customer: Customer, group: DispatchGroup) {
        print(String(format: endTaskMessgae, customer.waitingNumber, customer.grade.description, customer.taskType.description))
        NotificationCenter.default.post(name: .finishBankerTask, object: self.bankerNumber)
        group.leave()
    }
}
