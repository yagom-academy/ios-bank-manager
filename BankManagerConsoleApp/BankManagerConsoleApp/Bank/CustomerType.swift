//
//  CustomerType.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/08.
//

import Foundation

enum CustomerType {
    case deposit
    case loan
    
    var wasteSeconds: TimeInterval {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
