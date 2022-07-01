//
//  Request.swift
//  BankManagerConsoleApp
//
//  Created by minsson, Derrick kim on 2022/07/01.
//

import Foundation

enum Request {
    case task
}

extension Request {
    var processingTime: Double {
        switch self {
        case .task:
            return 0.7
        }
    }
}
