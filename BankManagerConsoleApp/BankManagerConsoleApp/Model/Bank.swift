//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by ehd on 2021/08/02.
//

import Foundation

class Bank {
    
    private let bankTeller = BankTeller()
    private var waitingLine = Queue<UInt>()
    private var totalTimeRequired: Double = 0.0
    
    func openBank() {
        arrangeClients()
        
        while waitingLine.isEmpty() == false {
            startWork()
        }
        finishWork()
    }
    
    private func arrangeClients() {
        (1...numberOfClients).forEach {
            let client = Client(waitingNumber: $0)
            waitingLine.enqueue(data: client.waitingNumber)
        }
    }
    
    private func startWork() {
        guard let clientNumber = waitingLine.dequeue()?.data else {
            return
        }
        bankTeller.receive(client: clientNumber)
        totalTimeRequired += BankTeller.Work.deposit.time
    }
    
    private func finishWork() {
        if waitingLine.isEmpty() {
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClients)명이며, 총 업무시간은 \(String(format: "%.2f", totalTimeRequired))초입니다.")
        }
        try? bankManager.chooseOption()
    }
}
