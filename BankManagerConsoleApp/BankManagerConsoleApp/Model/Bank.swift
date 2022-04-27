//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana 2022/04/26.
//

final class Bank {
    var clerks: [BankClerk] = []
    var clients: Queue<Client> = Queue()
    private var clientCount: Int = 0
    
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
}
