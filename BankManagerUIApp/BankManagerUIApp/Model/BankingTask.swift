//
//  BankingTask.swift
//  BankManagerUIApp
//
//  Created by 박세웅 on 2022/05/05.
//

import Foundation

enum BankingTask: String, CaseIterable {
    case deposit = "예금업무"
    case loan = "대출업무"

    var workTime: Double {
        switch self {
        case .deposit:
            return WorkTime.deposit
        case .loan:
            return WorkTime.loan
        }
    }
}

extension BankingTask {
    private enum WorkTime {
        static let deposit: Double = 0.7
        static let loan: Double = 1.1
    }
}
