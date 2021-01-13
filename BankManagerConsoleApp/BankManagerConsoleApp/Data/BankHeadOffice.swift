//
//  BankHeadOffice.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/13.
//

import Foundation

class BankHeadOffice {
    static let shared = BankHeadOffice()
    
    private let workingQueue: DispatchQueue
    private let startJudgeMessage = "%d번 %@고객 대출심사 시작"
    private let endJudgeMessage = "%d번 %@고객 대출심사 완료"
    private let judgeTime = 0.5
    
    private init() {
        self.workingQueue = DispatchQueue(label: "headOffice")
    }
    
    func addJudge(banker: Banker, customer: Customer, group: DispatchGroup) {
        workingQueue.async {
            print(String(format: self.startJudgeMessage, customer.waitingNumber, customer.grade.description))
            Thread.sleep(forTimeInterval: self.judgeTime)
            self.finishJudge(banker: banker, customer: customer, group: group)
        }
    }
    
    private func finishJudge(banker: Banker, customer: Customer, group: DispatchGroup) {
        print(String(format: endJudgeMessage, customer.waitingNumber, customer.grade.description))
        banker.executionLoan(customer: customer, group: group)
    }
}
