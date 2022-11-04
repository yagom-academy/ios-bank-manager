//
//  BankWorker.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/03.
//
import Foundation

protocol BankWorkable {
    func startWork(for client: Client)
    func finishWork(for client: Client)
}

extension BankWorkable {
    func startWork(for client: Client) {
        print("\(client.ticketNumber)번 고객 업무 시작")
        usleep(7 * 100000)
        finishWork(for: client)
    }
    
    func finishWork(for client: Client) {
        print("\(client.ticketNumber)번 고객 업무 종료")
    }
}

struct BankWorker: BankWorkable { }
