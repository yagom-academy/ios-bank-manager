//
//  BankWorker.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/03.
//

struct BankWorker {
    func startWork(client: Client) {
        print("\(client.ticketNumber)번 고객 업무 시작")
        finishWork(client: client)
    }
    
    func finishWork(client: Client) {
        print("\(client.ticketNumber)번 고객 업무 종료")
    }
}
