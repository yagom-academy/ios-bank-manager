//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/28.
//
enum BankTask: String, CaseIterable {
    case deposit = "예금 업무"
    case loan = "대출 업무"
    
    var numberOfBankers: Int {
        switch self {
        case .deposit:
            return 2
        case .loan:
            return 1
        }
    }
}

struct Customer {
    let numberTicekt: Int
    let task: BankTask?
    
    init(numberTicekt: Int) {
        self.numberTicekt = numberTicekt
        self.task = BankTask.allCases.randomElement()
    }
}
