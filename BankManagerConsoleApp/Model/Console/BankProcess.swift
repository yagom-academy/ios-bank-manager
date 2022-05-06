//
//  BankProcess.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/04/28.
//

import Foundation

struct BankProcess {
    private enum Constant {
        static let clientCount = 10
    }

    private var bank: Bank
    private var currentNumber: Int = 1
    private var endNumber: Int {
        return currentNumber + Constant.clientCount
    }
    
    mutating func addClientQueue() {
        var clientQueue = Queue<Client>()
        for waitingNumber in currentNumber..<endNumber {
            clientQueue.enqueue(Client(waitingNumber: waitingNumber))
        }
        currentNumber += Constant.clientCount
        bank.startWork(clientQueue: &clientQueue)
    }
}
