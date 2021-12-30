//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by Sunwoo on 2021/12/27.
//

import Foundation

struct Ticket {
    let number: Int
}

enum Task: CaseIterable, CustomStringConvertible {
    case loan
    case deposit
    
    var description: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    }
    
    var duration: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
}

struct Client {
    let orderTicket: Ticket
    let task: Task
    
    var taskDuration: Double {
        return task.duration
    }
}
