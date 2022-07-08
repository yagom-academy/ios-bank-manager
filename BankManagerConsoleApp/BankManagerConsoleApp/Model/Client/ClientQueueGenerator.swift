//
//  ClientGenerator.swift
//  BankManagerConsoleApp
//
//  Created by Derrick kim on 2022/07/07.
//

struct ClientQueueGenerator {
    func generate() -> (deposit: ClientQueue<Client>, loan: ClientQueue<Client>) {
        let numberOfClients = Int.random(in: 10...30)
        
        var depositClientQueue = ClientQueue<Client>()
        var loanClientQueue = ClientQueue<Client>()
        
        for number in 1...numberOfClients {
            guard let requestName = Request.allCases.randomElement() else {
                return (ClientQueue<Client>(), ClientQueue<Client>())
            }
            
            switch requestName {
            case .deposit:
                depositClientQueue.enqueue(Client(request: requestName, waitingNumber: number))
            case .loan:
                loanClientQueue.enqueue(Client(request: requestName, waitingNumber: number))
            }
        }
        
        return (depositClientQueue, loanClientQueue)
    }
}
