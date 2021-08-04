//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by ehd on 2021/08/02.
//

import Foundation

protocol BankTellerRole {
    func receive(client: UInt)
}

class BankTeller: BankTellerRole {
    
    enum Work {
        case deposit
        case loan
        var time: Double {
            switch self {
            case .deposit:
                return 0.7
            case .loan:
                return 1.1
            }
        }
    }
    
    func receive(client: UInt) {
        print("\(client)번 업무처리 시작")
        usleep(700000)
        print("\(client)번 업무처리 완료")
    }
}
