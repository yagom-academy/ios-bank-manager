//
//  BankWorker.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/03.
//

import Foundation

protocol BankWorkable {
    var bankWork: BankWork { get set }
    
    func startWork(for client: Client)
    func finishWork(for client: Client, about bankWork: BankWork)
}

extension BankWorkable {
    func startWork(for client: Client) {
        print("\(client.ticketNumber)번 고객 \(bankWork.name)업무 시작")
        usleep(bankWork.workTime)
        finishWork(for: client, about: bankWork)
    }
    
    func finishWork(for client: Client, about: BankWork) {
        print("\(client.ticketNumber)번 고객 \(bankWork.name)업무 종료")
    }
}

struct BankWorker: BankWorkable {
    var bankWork: BankWork = .none
}
