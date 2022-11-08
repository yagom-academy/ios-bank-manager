//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/04.
//

struct BankManager {
    private let bankWorker: BankWorkable
    private let clientQueue: Queue<Client> = Queue()
    private var totalClientCount: Int = 0
    
    init(bankWorker: BankWorkable) {
        self.bankWorker = bankWorker
    }
    
    mutating func addClientQueue(_ client: Client) {
        totalClientCount += 1
        clientQueue.enqueue(client)
    }
    
    private func directBankWork() {
        while !clientQueue.isEmpty {
            guard let client = clientQueue.dequeue() else { return }
            
            bankWorker.startWork(for: client)
        }
    }
    
    func open() {
        directBankWork()
    }
    
    mutating func close() {
        let time: Double = Double(totalClientCount) * 0.7
        let message: String =
        String(format: "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초 입니다.",
               totalClientCount,
               time)
        
        print("\(message)")
        totalClientCount = 0
    }
}
