//
//  Task.swift
//  BankManagerConsoleApp
//
//  Created by Charlotte, Soll on 2021/08/04.
//

import Foundation

enum Task: String, CustomStringConvertible {
    case deposit = "예금업무"
    case loan = "대출업무"
    
    var description: String {
        return self.rawValue
    }
}
