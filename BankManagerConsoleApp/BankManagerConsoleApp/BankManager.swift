//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//MARK: Menu Input Namespace
enum BankMenu {
    static let openBank = "1"
    static let exit = "2"
}

struct BankManager {
    //MARK: Properties
    private var bank: Bank
    
    init(bank: Bank) {
        self.bank = bank
    }
}

//MARK:- ConsoleApp Manage Method
extension BankManager {
    mutating func start() {
        let totalCustomer = gatherCustomers()
        formWaitingLine(from: totalCustomer)
        askWork()
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
        bank.letClerkWork(BankProcessTime.loan, BankProcessTime.deposit)
    }
    
    private mutating func showWorkResult(_ total: Int, _ time: String) {
        bank.notifyClosing(totalCustomer: total, totalTime: time)
    }
}
