//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum BankMenu {
    static let open = "1"
    static let exit = "2"
}

struct BankManager {
    private var bank = Bank()
}

extension BankManager {
    mutating func start() {
        let totalCustomer = gatherCustomers()
        formWaitingLine(from: totalCustomer)
        let totalTime = checkWorkingTime {
            askWork()
        }
        showWorkResult(totalCustomer, totalTime)
    }
    
    func end() {
        return
    }
    
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
    
    private func gatherCustomers() -> Int {
        let range = (10...30)
        let totalNumber = Int.random(in: range)
        return totalNumber
    }
    
    private mutating func formWaitingLine(from totalCustomer: Int) {
        bank.makeWaitingLine(from: totalCustomer)
    }
    
    private mutating func askWork() {
        bank.letClerkWork()
    }
    
    private mutating func showWorkResult(_ total: Int, _ time: String) {
        bank.notifyClosing(totalCustomer: total, totalTime: time)
    }
    
    private func checkWorkingTime(_ block: () -> ()) -> String {
        let start = Date()
        block()
        let totalTime = Date().timeIntervalSince(start)
        return totalTime.description
    }
}
