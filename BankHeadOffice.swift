//
//  BankHeadOffice.swift
//  BankManagerConsoleApp
//
//  Created by Kyungmin Lee on 2021/01/15.
//

import Foundation

class BankHeadOffice {
    static let shared: BankHeadOffice = BankHeadOffice()
    private let judgementLoanQueue: DispatchQueue = DispatchQueue(label: "JudgementLoan")
    private let judgeLoanTime: TimeInterval = 0.5
    
    func addJudgementLoan(_ bankClerk: BankClerk) {
        judgementLoanQueue.sync {
            judgeLoan(bankClerk)
        }
    }
    
    func judgeLoan(_ bankClerk: BankClerk) {
        guard let client = bankClerk.currentClient else {
            return
        }

        print("\(client.tag)번 \(client.priority.string)고객 대출심사 시작")
        Thread.sleep(forTimeInterval: judgeLoanTime)
        print("\(client.tag)번 \(client.priority.string)고객 대출심사 완료")
        NotificationCenter.default.post(name: NSNotification.Name("requestLoan#\(bankClerk.bankWindowNumber)"), object: nil, userInfo: nil)
    }
    
    private init() {}
}
