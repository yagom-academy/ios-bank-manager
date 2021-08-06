//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by ehd on 2021/08/02.
//

import Foundation

protocol BankTellerRole {
    func receive(clientNumber: UInt, work: BusinessCategory)
}

class BankTeller: BankTellerRole {
    
    func receive(clientNumber: UInt, work: BusinessCategory) {
        print("\(clientNumber)번 \(work.description)업무처리 시작")
        switch work {
        case .deposit:
            usleep(work.time)
        case .loan:
            usleep(work.time)
        }
        print("\(clientNumber)번 \(work.description)업무처리 완료")
    }
}
