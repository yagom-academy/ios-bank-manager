//
//  Customer.swift
//  BankManagerUIApp
//
//  Created by Donnie, Safari on 2022/05/04.
//

import Foundation

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
        
        var time: Double {
            switch self {
            case .deposit:
                return 0.7
            case .loan:
                return 1.1
            }
        }
        
        func start(deposit: OperationQueue, loan: OperationQueue) -> OperationQueue {
            switch self {
            case .deposit:
                return deposit
            case .loan:
                return loan
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
