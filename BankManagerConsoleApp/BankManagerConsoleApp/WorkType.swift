//
//  WorkType.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

enum WorkType: String, CaseIterable {
    case loan = "대출"
    case deposit = "예금"
    
    var description: String {
        return self.rawValue
    }
}
