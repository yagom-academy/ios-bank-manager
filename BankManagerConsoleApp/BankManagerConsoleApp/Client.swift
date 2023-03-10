//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by kaki, songjun on 2023/03/10.
//

struct Client {
    let clientNumber: Int
    let requstedTask: Banktask
    
    enum Banktask: Int {
        case loan = 1
        case deposit = 2
        
        var taskName: String {
            switch self {
            case .loan:
                return "대출"
            case .deposit:
                return "예금"
            }
        }
    }
}
