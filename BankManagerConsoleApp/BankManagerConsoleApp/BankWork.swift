//
//  Bankwork.swift
//  BankManagerConsoleApp
//
//  Created by Do Yi Lee on 2021/08/05.
//

import Foundation

//MARK: NameSpace
enum CustomerBusiness: String, CaseIterable {
    case loan = "대출"
    case deposit = "예금"
    
    var task: String {
        self.rawValue
    }
}

enum BankProcessTime {
    static let loan = 1.1
    static let deposit = 0.7
}
