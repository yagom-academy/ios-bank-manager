//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/04.
//

import Foundation

class Banker {
    let workingQueue: DispatchQueue
    var isWorking = false
    private let startTaskMessgae = "%d번 %@고객 %@업무 시작"
    private let endTaskMessgae = "%d번 %@고객 %@업무 완료"
    
    // MARK: - init func
    init(_ number: Int) {
        self.workingQueue = DispatchQueue(label: "\(number)")
    }
    
    func startWork(customer: Customer) {
        print(String(format: startTaskMessgae, customer.waitingNumber, customer.customerGrade.gradeString, customer.taskType.taskString))
        isWorking = true
        workingQueue.asyncAfter(deadline: .now() + customer.taskType.taskTime) {
            self.finishWork(customer: customer)
        }
    }
    
    private func finishWork(customer: Customer) {
        print(String(format: endTaskMessgae, customer.waitingNumber, customer.customerGrade.gradeString, customer.taskType.taskString))
        isWorking = false
    }
}
