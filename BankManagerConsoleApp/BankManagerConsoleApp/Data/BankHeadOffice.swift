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
    
    func addJudge(bankerNumber: Int, customer: Customer, group: DispatchGroup) {
        group.enter()
        print(String(format: startJudgeMessage, customer.waitingNumber, customer.grade.description))
        workingQueue.asyncAfter(deadline: .now() + judgeTime) {
            self.finishJudge(bankerNumber: bankerNumber, customer: customer, group: group)
        }
    }
    
    private func finishJudge(bankerNumber: Int, customer: Customer, group: DispatchGroup) {
        print(String(format: endJudgeMessage, customer.waitingNumber, customer.grade.description))
        NotificationCenter.default.post(name: .finishLoanJudge, object: bankerNumber)
        group.leave()
    }
}
