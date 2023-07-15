//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by Zion, Whales on 2023/07/12.
//

struct Client {
    enum WorkType: String {
        case loan = "대출"
        case deposit = "예금"
        
        var taskTime: Double {
            switch self {
            case .loan:
                return 1.1
            case .deposit:
                return 0.7
            }
        }
    }
    
    let turn: Int
    let workType: WorkType
    
    init(_ turn: Int, workType: WorkType) {
        self.turn = turn
        self.workType = workType
    }
}
