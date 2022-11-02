//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

struct Bank {
    var clientQueue: ClientQueue<Client> = ClientQueue()
    var bankWorker: BankWorker
    var bankManager: BankManager = BankManager()
    
    mutating func openBank(clients: [Client]) {
        while true {
            print("1 : 은행개점")
            print("2 : 종료")
            print("입력 : ", terminator: "")
            guard let input = readLine(), let menu = Int(input), 1...2 ~= menu else {
                print("잘못된 입력입니다.")
                continue
            }
            guard menu == 1 else { return }
            
            enqueueClients(clients)
            bankManager.startTimer()
            startBankWork()
            bankManager.stopTimer()
            closeBank()
        }
    }
    
    mutating func enqueueClients(_ clients: [Client]) {
        clients.forEach { client in
            clientQueue.enqueue(client)
            bankManager.addCount()
        }
    }
    
    mutating func startBankWork() {
        for _ in 1...bankManager.bringClientCount() {
            guard let client = clientQueue.dequeue() else { return }
            bankWorker.startWork(client: client)
        }
    }
    
    func closeBank() {
        print("업무가 마감되었습니다.", terminator: "")
        print("오늘 업무를 처리한 고객은 총 \(bankManager.bringClientCount())명이며,", terminator: "")
        print("총 업무시간은 \(String(format: "%.2f", bankManager.bringTotalWorkTime()))초입니다.")
    }
}
