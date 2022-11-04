//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/03.
//
import Foundation

struct Bank {
    let bankWorker: BankWorker
    let numberTicketQueue: Queue<Client> = Queue()
    var cumulativeClientCount: Int = 0
    
    init(bankWorker: BankWorker) {
        self.bankWorker = bankWorker
    }
    
    mutating func updateClientList(_ client: Client) {
        cumulativeClientCount += 1
        numberTicketQueue.enqueue(client)
    }
    
    func directBankWorker() {
        while !numberTicketQueue.isEmpty {
            guard let client = numberTicketQueue.dequeue() else {
                return
            }
            
            bankWorker.startWork(client: client)
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
