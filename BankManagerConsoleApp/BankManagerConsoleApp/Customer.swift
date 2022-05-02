//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Donnie, Safari on 2022/04/27.
//

struct Customer {
    
    enum TaskList: CaseIterable {
        case deposit
        case loan
        
        var information: String {
            switch self {
            case .deposit:
                return "예금"
            case .loan:
                return "대출"
            }
        }
    }
    
    let numberTicket: Int
    let task: TaskList?
    
    init(numberTicket: Int) {
        self.numberTicket = numberTicket
        self.task = TaskList.allCases.randomElement()
    }
}
