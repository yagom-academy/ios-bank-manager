//
//  Task.swift
//  BankManagerConsoleApp
//
//  Created by 예거 on 2021/12/23.
//

import Foundation

enum Task {
    case deposit
    
    func work() {
        switch self {
        case .deposit:
            Thread.sleep(forTimeInterval: 0.7)
        }
    }
}
