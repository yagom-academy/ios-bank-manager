//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by hoon, minsup on 2023/07/14.
//

struct Customer {
    enum Task {
        case loan
        case deposit
        
        static var random: Self {
            return Int.random(in: 1...2) % 2 == 1 ? .loan : .deposit
        }
        
        var information: (title: String, time: Double) {
            switch self {
            case .loan:
                return ("대출", 1.1)
            case .deposit:
                return ("예금", 0.7)
            }
        }
    }
    
    let numberTicket: Int
    let task: Task
    
    init(_ numberTicket: Int) {
        self.numberTicket = numberTicket
        self.task = Task.random
    }
}
