//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/07.
//

import Foundation

struct BankTeller {
    func receiveClient(bankClient: BankClient) {
        print("\(bankClient.waitingNumber)번 고객 업무 시작")
        usleep(700000)
        print("\(bankClient.waitingNumber)번 고객 업무 완료")
    }
}
