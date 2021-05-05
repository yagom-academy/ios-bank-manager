//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by Yun, Ryan on 2021/04/27.
//

import Foundation

struct Client: Equatable {
    // MARK: - Properties
    let waitingNumber: Int
    let grade: Grade
    var bankingTask: BankingTask
    
    init(_ waitingNumber: Int) {
        self.waitingNumber = waitingNumber
        self.grade = Grade.random
        self.bankingTask = BankingTask()
        self.bankingTask.owner = self
    }
}

// MARK: - NameSpaces
extension Client {
    enum Grade: CaseIterable, Comparable {
        case vvip
        case vip
        case normal
        
        var name: String {
            switch self {
            case .vvip:
                return "VVIP"
            case .vip:
                return "VIP"
            case .normal:
                return "일반"
            }
        }
        
        static var random: Grade {
            guard let randomGrade: Grade = Grade.allCases.randomElement() else {
                return .normal
            }
            return randomGrade
        }
    }
}
