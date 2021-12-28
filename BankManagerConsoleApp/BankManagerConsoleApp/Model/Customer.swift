//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 이차민 on 2021/12/23.
//

import Foundation

struct Customer {
    var turn: Int
    var task: Task
    
    init(turn: Int) {
        self.turn = turn
        self.task = Task.createRandomTask()
    }
}

enum Task: CustomStringConvertible {
    case deposit
    case loan
    
    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
    var processingTime: Double {
        switch self {
        case .deposit:
            return 1.1
        case .loan:
            return 0.7
        }
    }
}

extension Task: CaseIterable {
    static func createRandomTask() -> Self {
        guard let task = Self.allCases.randomElement() else {
            fatalError()
        }
        return task
    }
}
