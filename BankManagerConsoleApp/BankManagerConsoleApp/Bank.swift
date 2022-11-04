//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/03.
//

struct Bank {
    let bankWorker: BankWorker
    let numberTicketQueue: Queue<Client>
    
    func returnTicketNumber() -> Int {
        return numberTicketQueue.linkedList.count
    }
    
    func updateClientList(_ client: Client) {
        numberTicketQueue.enqueue(client)
    }
}
