//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class LocalBankTask: Operation, BankTaskable {
    var waitingNumber: UInt?
    var creditRate: CreditRating?
    var workType: WorkType?

    override func main() {
        guard let waitNumber = waitingNumber,
              let credit = creditRate,
              let taskType = workType else { return }
        
        work(waitNumber, credit, taskType)
    }
    
    private func work(_ waitNumber: UInt, _ credit: CreditRating, _ taskType: WorkType) {
        switch taskType {
        case .deposit:
            print("\(waitNumber)번 \(credit)고객 \(taskType.description) 시작")
            Thread.sleep(forTimeInterval: taskType.duration)
            print("\(waitNumber)번 \(credit)고객 \(taskType.description) 완료")
        case .loan:
            let loanProcess = WorkType.LoanProcess.self
            print("\(waitNumber)번 \(credit)고객 \(loanProcess.loanReview)")
            let headBankTask = HeadBankTask()
            headBankTask.waitingNumber = waitNumber
            headBankTask.creditRate = credit
            headBankTask.workType = taskType
            HeadBank.shared.serveClient(headBankTask)
            print("\(waitNumber)번 \(credit)고객 \(loanProcess.loanExecution)")
        }
    }
}

