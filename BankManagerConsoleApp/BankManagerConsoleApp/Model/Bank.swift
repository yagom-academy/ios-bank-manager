//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana 2022/04/26.
//

private enum Range: Int {
    case startRandomNumber = 10
    case endRandomNumber = 30
    case startClientNumber = 1
}

private enum DefaultNumber: Int {
    case clientCount = 0
}

final class Bank {
    private(set) var clerks: [BankClerk] = []
    private(set) var clients: Queue<Client> = Queue()
    private var clientCount: Int = DefaultNumber.clientCount.rawValue
    
    private func generateClientCount() {
        let randomClientNumber = Int.random(in: Range.startRandomNumber.rawValue...Range.endRandomNumber.rawValue)
        clientCount = randomClientNumber
    }
    
    private func generateClient() {
        for number in Range.startClientNumber.rawValue...clientCount {
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
        print("""
              업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, \
              총 업무시간은 \(totalDuration.formatTwoDecimal)초입니다.
              """)
    }
}
