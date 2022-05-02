//
//  Presentable.swift
//  BankManagerConsoleApp
//
//  Created by 조민호 on 2022/04/27.
//

protocol Presentable {}

extension Presentable where Self: Bank {
    func printClosingMessage(clientCount: Int, totalWorkTime: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, 총 업무시간은 \(totalWorkTime)초입니다.")
    }
}

extension Presentable where Self: BankClerk {
    func printStartTaskMessage(client: Client) {
        print("\(client.waitingNumber)번 고객 \(client.bankService)업무 시작")
    }
    
    func printFinishTaskMessage(client: Client) {
        print("\(client.waitingNumber)번 고객 \(client.bankService)업무 완료")
    }
}
