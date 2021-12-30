//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

//MARK: - 타입
fileprivate enum MenuOption: String {
    case openBank = "1"
    case exit = "2"
}

//MARK: - 메서드
fileprivate func showMenu() {
    let menu = """
        1 : 은행개점
        2 : 종료
        입력 :
        """
    print(menu, terminator: " ")
}

fileprivate func getUserInput() throws -> MenuOption {
    guard let input = readLine(),
          let menuOption = MenuOption(rawValue: input) else {
        throw BankManagerError.invalidUserInput
    }
    
    return menuOption
}

fileprivate func generateClients() -> [Client] {
    let clientNumber = Int.random(in: 10...30)
    var clients: [Client] = []
    
    (1...clientNumber).forEach { number in
        let orderTicket = Ticket(number: number)
        let randomTaskIndex = Int.random(in: 0..<Task.allCases.count)
        let randomTask = Task.allCases[randomTaskIndex]
        let client = Client(orderTicket: orderTicket, task: randomTask)
        clients.append(client)
    }
    
    return clients
}

fileprivate func runProgram() {
    while true {
        do {
            showMenu()
            let userInput = try getUserInput()
            
            switch userInput {
            case .openBank:
                let clients = generateClients()
                bankManager.openBank(for: clients)
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

var bank = Bank(numberOfClerks: 1)
var bankManager = BankManager(bank: bank)

runProgram()
