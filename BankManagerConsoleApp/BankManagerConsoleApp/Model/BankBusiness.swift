//
//  BankBusiness.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Zhilly, Minii All rights reserved.

enum BankBusiness: String, CaseIterable {
    case deposit = "예금"
    case loans = "대출"
    
    var businessTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loans:
            return 1.1
        }
    }
}
