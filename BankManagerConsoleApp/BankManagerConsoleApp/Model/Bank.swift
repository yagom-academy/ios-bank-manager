//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana 2022/04/26.
//

final class Bank {
    var clerks: [BankClerk] = []
    var clients: Queue<Client> = Queue()
    var clientCount: Int = 0
    
    private func generateClientCount() {
        let randomClientNumber = Int.random(in: 10...30)
        clientCount = randomClientNumber
    }
    
    private func generateClient() {
        for number in 0..<clientCount {
            clients.enqueue(data: Client(number: number))
        }
    }
    
    private func configureClerks() {
        let clerk = BankClerk()
        clerks.append(clerk)
    }
    
    private func cofigureClients() {
        generateClientCount()
        generateClient()
    }
    
    func open() {
        cofigureClients()
        configureClerks()
    }
    
    func close(totalDuration: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, 총 업무시간은 \(totalDuration)초입니다.")
    }
}
