//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    var bank = Bank()
}

extension BankManager {
    enum BankOpenMenu {
        static let open = "1"
        static let exit = "2"
    }
    
    mutating func start() {
        decideBankOpen(selectedOption: takeAnswer())
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
    
    mutating func decideBankOpen(selectedOption: String?) {
        guard let selected = selectedOption else {
            return
        }
        
//        switch selected {
//        case BankOpenMenu.open:
//            let customer = Customer().totalNumber
//            return calculateWorkTime(with: customer)
//        case BankOpenMenu.exit:
//
//        default:
//            fatalError()
//        }
    }
    
    mutating func work(with customer: Int) {
        var waitingLine = self.bank.makeWaitingLine(from: customer)
        for _ in 1...customer {
            self.bank.bankClerk.handleTask(of: waitingLine.dequeue())
        }
    }
    
    mutating func calculateWorkTime(with: Int) -> String {
        let time = timeCheck {
            work(with: with)
        }
        return time
    }
}
