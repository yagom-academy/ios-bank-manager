//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/07.
//

import Foundation

struct BankTeller {
    let requiredTime: Double = 0.7
    
    func receiveClient(bankClient: BankClient) {
        print("\(bankClient.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: requiredTime)
        print("\(bankClient.waitingNumber)번 고객 업무 완료")
    }
}
