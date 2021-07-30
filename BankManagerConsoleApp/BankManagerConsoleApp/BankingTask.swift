//
//  BankingTask.swift
//  BankManagerConsoleApp
//
//  Created by JINHONG AN on 2021/07/30.
//

import Foundation

enum BankingTask {
    case unspecified
    
    var timeRequired: Double {
        switch self {
        case .unspecified:
            return 0.7
        }
    }
}
