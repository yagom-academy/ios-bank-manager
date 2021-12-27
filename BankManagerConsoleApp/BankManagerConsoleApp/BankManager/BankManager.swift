//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    
    private let bank = Bank()
    
    init() {
        bank.delegate = self
    }
    
    func startConsole() {
        let choice = askMenu()
        switch choice {
            case Console.Input.open.rawValue:
            openBank()
            startConsole()
            case Console.Input.exit.rawValue:
            return
        default:
            restartConsole()
        }
    }
    
    private func askMenu() -> String {
        print(Console.Message.menu.rawValue, terminator: String.empty)
        return readLine() ?? String.empty
    }
    
    private func openBank() {
        let clientCount = Int.random(in: 10...30)
        let firstNumber = 1
        
        for order in firstNumber...clientCount {
            let client = Client(waitingNumber: order, task: Task.random)
            bank.lineUp(client)
        }
        bank.start()
    }
    
    private func restartConsole() {
        print(Console.Message.invalidInput.rawValue)
        startConsole()
    }
}

extension BankManager: BankMessagePresenter {
    
    func bankDidClose(totalClient: Int, for duration: String) {
        print(Console.Message.closeBank(totalClient, duration))
    }
    
    func bank(willBeginServiceFor clientNumber: Int, task: String) {
        print(Console.Message.beginService(of: clientNumber, task: task))
    }
    
    func bank(didEndServiceFor clientNumber: Int, task: String) {
        print(Console.Message.endService(of: clientNumber, task: task))
    }
}
