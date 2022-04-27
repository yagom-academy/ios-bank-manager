//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 허윤영 on 27/04/2022.
//

protocol BankDelegate: AnyObject {
    func close(totalWorkTime: String)
}

final class Bank: BankDelegate {
    private let clientQueue = Queue<Client>()
    private let bankClerk: BankClerk
    private let clientCount = Int.random(in: 10 ... 30)
    
    init(bankClerk: BankClerk) {
        self.bankClerk = bankClerk
        bankClerk.setDelegate(delegate: self)
    }
    
    private func receiveClients() {
        for order in 1 ... clientCount {
            clientQueue.enqueue(Client(waitingNumber: order))
        }
    }
    
    func open() {
        receiveClients()
        bankClerk.work(clientQueue)
    }
    
    func close(totalWorkTime: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, 총 업무시간은 \(totalWorkTime)초입니다.")
    }
}
