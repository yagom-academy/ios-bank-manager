//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class LocalBankTask: Operation {
    let waitingNumber: UInt
    let creditRate: CreditRating
    let workType: WorkType
    
    init?(_ number: UInt) {
        guard let credit = CreditRating.allCases.shuffled().first,
              let work = WorkType.allCases.shuffled().first else {
            
            return nil
        }
        
        self.waitingNumber = number
        self.creditRate = credit
        self.workType = work
    }

    override func main() {
        work(waitingNumber, creditRate, workType)
    }
    
    private func work(_ waitNumber: UInt, _ credit: CreditRating, _ taskType: WorkType) {
        switch taskType {
        case .deposit:
            print("\(waitNumber)번 \(credit)고객 \(taskType.description) 시작")
            Thread.sleep(forTimeInterval: taskType.duration)
            print("\(waitNumber)번 \(credit)고객 \(taskType.description) 완료")
        case .loan:
            let loanProcess = WorkType.LoanProcess.self
            print("\(waitNumber)번 \(credit)고객 \(loanProcess.loanExecution) 시작")
            let headBankTask = HeadBankTask()
            headBankTask.waitingNumber = waitNumber
            headBankTask.creditRate = credit
            headBankTask.workType = taskType
            HeadBank.shared.serveClient(headBankTask)
            print("\(waitNumber)번 \(credit)고객 \(loanProcess.loanExecution) 완료")
        }
    }
}

