//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bank = Bank()
}

extension BankManager {
    func takeAnswer() -> String? {
        let question = """
            1 : 은행개점
            2 : 종료
            입력 :
            """
        print(question, terminator: "")
        let input = readLine()
        return input
    }
    
    func gatherCustomers() -> Int {
        let range = (10...30)
        let totalNumber = Int.random(in: range)
        return totalNumber
    }
    
    mutating func formWaitingLine(from totalCustomer: Int) {
        bank.makeWaitingLine(from: totalCustomer)
    }
    
    mutating func askWork() {
        bank.letClerkWork()
    }
    
    func showWorkResult(_ total: Int, _ time: String) {
        bankManager.bank.notifyClosing(totalCustomer: total, totalTime: time)
    }
    
    func checkWorkingTime(_ block: () -> ()) -> String {
        let start = Date()
        block()
        let totalTime = Date().timeIntervalSince(start)
        return totalTime.description
    }
}
