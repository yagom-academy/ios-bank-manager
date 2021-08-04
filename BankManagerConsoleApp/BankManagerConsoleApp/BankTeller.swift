//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by ehd on 2021/08/02.
//

import Foundation

protocol BankTellerRole {
    func recieveClient(_ client: UInt)
}

class BankTeller: BankTellerRole {
    func recieveClient(_ client: UInt) {
        print("\(client)번 업무처리 시작")
        usleep(700000)
        print("\(client)번 업무처리 완료")
    }
}
