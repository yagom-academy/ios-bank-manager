//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/04/27.
//

import Foundation

protocol Bank: class {
    var numberTicket: Int { get set }
    func getNewTicket() -> Int
    func close()
}

extension Bank {
    func getNewTicket() -> Int {
        numberTicket += 1
        return numberTicket
    }
    
    func getTimeDuration() -> String {
        let timeDuration = Double(numberTicket) * 0.7
        return String(format: "%.2f", timeDuration)
    }
    
    func close() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberTicket)명이며, 총 업무시간은 \(getTimeDuration())초입니다.")
        resetNumberTicket()
    }
    
    func resetNumberTicket() {
        numberTicket = 0
    }
}
