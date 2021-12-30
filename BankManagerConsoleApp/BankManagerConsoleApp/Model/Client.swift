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

enum Task {
    case financialBusiness
    
    var duration: Double {
        switch self {
        default:
            return 0.7
        }
    }
}

struct Client {
    let orderTicket: Ticket
    private let task = Task.financialBusiness
    
    var taskDuration: Double {
        return task.duration
    }
}
