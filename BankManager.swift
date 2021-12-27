//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    
    //MARK: - 중첩 타입
    private enum MenuOption: String {
        case openBank = "1"
        case exit = "2"
    }
    
    //MARK: - 저장 속성
    private var bank = Bank(numberOfClerks: 1)
    
    //MARK: - Internal 메서드
    mutating func startConsoleProgram() {
        while true {
            do {
                showMenu()
                let userInput = try userInput()
                
                switch userInput {
                case .openBank:
                    supplyClientsToBank()
                    bank.openBank()
                case .exit:
                    return
                }
            } catch BankManagerError.invalidUserInput {
                print(BankManagerError.invalidUserInput.description)
                print("다시 입력해주십시오.\n")
            } catch {
                print(error)
            }
        }
    }
    
    //MARK: - Private 메서드
    private func showMenu() {
        let menu = """
            1 : 은행개점
            2 : 종료
            입력 :
            """
        print(menu, terminator: " ")
    }
    
    private func userInput() throws -> MenuOption {
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
    
    private mutating func supplyClientsToBank() {
        let clients = generateClients()
        bank.receive(clients: clients)
    }
}
