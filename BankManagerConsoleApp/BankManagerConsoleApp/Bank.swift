//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by ehd on 2021/08/02.
//

import Foundation

class Bank {
    private let bankTeller = BankTeller()
    var waitingLine = Queue<UInt>()
    var totalTimeRequired: Double = 0.0
    
    func arrangeClients() {
        (1...numberOfClients).forEach { (waitingNumber) in
            let client = Client.init(waitingNumber: waitingNumber)
            waitingLine.enqueue(data: client.waitingNumber)
        }
    }
    
    func startWork() {
        guard let clientNumber = waitingLine.dequeue() else {
            return
        }
        bankTeller.recieveClient(clientNumber)
        let timeRequiredFordeposit = 0.7
        totalTimeRequired += timeRequiredFordeposit
    }
    
    func finishWork() {
        if waitingLine.isEmpty() {
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClients)명이며, 총 업무시간은 \(String(format: "%.2f", totalTimeRequired))초입니다.")
        }
        
    }
}

