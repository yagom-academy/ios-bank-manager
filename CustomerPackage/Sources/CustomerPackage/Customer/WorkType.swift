//
//  WorkType.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/14.
//

import UIKit

public enum WorkType: CaseIterable {
    case loan, deposit
    
    public var taskTime: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
    
    public var numberOfBankClerk: Int {
        switch self {
        case .loan:
            return 1
        case .deposit:
            return 2
        }
    }
    
    public var name: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    }
    
    public var tintColor: UIColor {
        switch self {
        case .loan:
            return .systemPurple
        case .deposit:
            return .black
        }
    }
}
