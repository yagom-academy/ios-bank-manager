//
//  HeadBankTask.swift
//  BankManagerConsoleApp
//
//  Created by 윤재웅 on 2021/05/03.
//

import Foundation

final class HeadBankTask: Operation {
    var evaluationSheet: BankTaskable?
    var waitingNumber: UInt?
    var creditRate: CreditRating?
    var workType: WorkType?
    
    override func main() {
        guard let waitNumber = waitingNumber,
              let credit = creditRate,
              let work = workType else {
            return
        }
        evaluateCredit(waitNumber, credit, work)
    }
    
    private func evaluateCredit(_ waitNumber: UInt, _ credit: CreditRating, _ work: WorkType) {
        let loanProcess = WorkType.LoanProcess.self
        print("\(waitNumber)번 \(credit)고객 \(loanProcess.loanEvaluation) 시작")
        Thread.sleep(forTimeInterval: work.duration)
    }
}
