//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    enum MenuOption: String {
        case openBank = "1"
        case exit = "2"
    }
    
    var bank = Bank(numberOfClerks: 1)
    
    mutating func startConsoleProgram() {
        do {
            while true {
                showMenu()
                let userInput = try userInput()
                switch userInput {
                case .openBank:
                    supplyClientsToBank()
                    bank.openBank()
                case .exit:
                    return
                }
            }
        } catch {
            print(error)
        }
    }
    
    func showMenu() {
        let menu = """
            1 : 은행개점
            2 : 종료
            입력 :
            """
        print(menu, terminator: " ")
    }
    
    func userInput() throws -> MenuOption {
        guard let input = readLine(),
              let menuOption = MenuOption(rawValue: input) else {
            throw BankManagerError.invalidUserInput
        }
        
        return menuOption
    }
    
    private func generateClients() -> [Client] {
        let clientNumber = Int.random(in: 10...30)
        var clients: [Client] = []
        
        (1...clientNumber).forEach { number in
            let orderTicket = Ticket(number: number)
            let client = Client(orderTicket: orderTicket)
            clients.append(client)
        }
        
        return clients
    }
    
    mutating func supplyClientsToBank() {
        let clients = generateClients()
        bank.receive(clients: clients)
    }
}
