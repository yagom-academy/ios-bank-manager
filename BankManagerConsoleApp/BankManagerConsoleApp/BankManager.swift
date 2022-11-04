//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/04.
//

import Foundation

struct BankManager {
    let bankWorker: BankWorkable
    let clientQueue: Queue<Client> = Queue()
    var cumulativeClientCount: Int = 0
    
    mutating func addClientQueue(_ client: Client) {
        cumulativeClientCount += 1
        clientQueue.enqueue(client)
    }
    
    func directBankWorker() {
        while !clientQueue.isEmpty {
            guard let client = clientQueue.dequeue() else { return }
            
            bankWorker.startWork(for: client)
        }
    }
    
    func open() {
        directBankWorker()
    }
    
    mutating func close() {
        let time: Double = Double(cumulativeClientCount) * 0.7
        let message: String =
        String(format: "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초 입니다.",
               cumulativeClientCount,
               time)
        
        print("\(message)")
        cumulativeClientCount = 0
    }
}
