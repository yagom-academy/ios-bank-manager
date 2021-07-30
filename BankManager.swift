//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    enum Menu: Int {
        case openingBank = 1
        case exit = 2
    }
    
    private let bank: Bank
    
    init() {
        self.bank = Bank()
    }
    
    private func showMenu() {
        let menu = """
            1 : 은행개점
            2 : 종료
            입력 :
            """
        print(menu, terminator: " ")
    }
    
    private func showWrongInputMessage() {
        print("잘못된 입력 입니다.")
    }
    
    private func showClosingMessage(numberOfClient: UInt, totalTaskTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient)명이며, 총 업무시간은 \(totalTaskTime)초 입니다.")
    }
    
    private func inputFromUser() -> Menu {
        showMenu()
        guard let input = readLine(),
              let inputNumber = Int(input),
              let menuNumber = Menu(rawValue: inputNumber) else {
            showWrongInputMessage()
            return inputFromUser()
        }
        return menuNumber
    }
    
    private func generateClients() -> [Client] {
        var clients: [Client] = []
        let minimumClientCount = 10
        let maximunClientCOunt = 30
        let randomNumber = Int.random(in: minimumClientCount...maximunClientCOunt)
        
        for _ in 0..<randomNumber {
            let client = Client()
            clients.append(client)
        }
        return clients
    }
    
    private func openBank() {
        let clients = generateClients()
        bank.receiveClient(clients: clients)
        let (numberOfClient, totalTaskTime) = bank.doTask()
        showClosingMessage(numberOfClient: numberOfClient, totalTaskTime: totalTaskTime)
    }
    
    func run() {
        while true {
            let userInput = inputFromUser()
            switch userInput {
            case .openingBank:
                openBank()
            case .exit:
                return
            }
        }
    }
}
