//
//  Task.swift
//  BankManagerConsoleApp
//
//  Created by Charlotte, Soll on 2021/08/04.
//

import Foundation

enum Task: String, CustomStringConvertible, CaseIterable {
    case deposit = "예금업무"
    case loan = "대출업무"
    
    var description: String {
        return self.rawValue
    }
    
    static func random<G: RandomNumberGenerator>(using generator: inout G) -> Task {
        return Task.allCases.randomElement(using: &generator)!
    }
    
    static func random() -> Task {
        var g = SystemRandomNumberGenerator()
        return Task.random(using: &g)
    }
}
