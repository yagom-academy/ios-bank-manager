//
//  HeadBankTask.swift
//  BankManagerConsoleApp
//
//  Created by 윤재웅 on 2021/05/03.
//

import Foundation

final class HeadBankTask: Operation {
    var waitingNumber: UInt
    var creditRate: CreditRating
    var workType: WorkType
    
    init(number waitingNumber: UInt, rating creditRate: CreditRating, type workType: WorkType) {
        self.waitingNumber = waitingNumber
        self.creditRate = creditRate
        self.workType = workType
    }
    
    override func main() {
        let loanProcess = WorkType.LoanProcess.self
        print("\(waitingNumber)번 \(creditRate)고객 \(loanProcess.loanEvaluation) 시작")
        Thread.sleep(forTimeInterval: workType.duration)
        print("\(waitingNumber)번 \(creditRate)고객 \(loanProcess.loanEvaluation) 완료")
    }
}
