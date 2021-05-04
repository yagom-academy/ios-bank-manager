//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Bank {
    var teller: Tellable
    var clients = Queue<Int>()
    
    init(teller: Tellable) {
        self.teller = teller
    }
    
    func startService() {
        showInitialMenu()
        
        let input = receiveUserInput()
        
        switch input {
        case "1":
            let theNumberofClients = pickTheNumberOfClients()
            
            enqueueClient(theNumberofClients)
            teller.conductService(&clients)
            
            startService()
        case "2":
            return
        default:
            print(Messages.unknownInputMessage.rawValue)
            startService()
        }
    }
    
    private func showInitialMenu() {
        print(Messages.initialChoiceMessage.rawValue)
        print("입력", terminator: " : ")
    }
    
    private func receiveUserInput() -> String? {
        let userInput = readLine()
        
        guard let input = userInput else {
            return nil
        }
        
        return input
    }
    
    private func pickTheNumberOfClients() -> Int {
        let randomClientsNumber = Int.random(in: RandomNumberBoundary.minimum.rawValue...RandomNumberBoundary.maximum.rawValue)
        return randomClientsNumber
    }
    
    private func enqueueClient(_ clientNumber: Int) {
        for index in 1...clientNumber {
            clients.enqueue(index)
        }
    }
}
