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
    
    // MARK:- Property
    private let bank: Bank
    
    // MARK:- initializer
    init() {
        self.bank = Bank()
    }
}

// MARK:- run() related Methods
extension BankManager {
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
    
    private func executeBankBusiness() {
        let clients = generateClients()
        bank.receiveClient(clients: clients)
        bank.readyForWork()
        let (numberOfClient, totalTaskTime) = bank.doTask()
        showClosingMessage(numberOfClient: numberOfClient, totalTaskTime: totalTaskTime)
        bank.finishWork()
    }
    
    func run() {
        while true {
            let userInput = inputFromUser()
            switch userInput {
            case .openingBank:
                executeBankBusiness()
            case .exit:
                return
            }
        }
    }
}

// MARK:- print() related Methods
extension BankManager {
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
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient)명이며, 총 업무시간은 \(customNuberFormatter(number: totalTaskTime))초 입니다.")
    }
}

// MARK:- ETC. private Methods
extension BankManager {
    private func customNuberFormatter(number: Double, dotDigit: Int = 2) -> Double {
        let powNumber = pow(10.0, Double(dotDigit))
        let multipliedPowNumber = Int(number * powNumber)
        let dividedNumber = Double(multipliedPowNumber) / powNumber
        return dividedNumber
    }
    
    private func generateClients() -> [Client] {
        var clients: [Client] = []
        let clientRange = ClientCount.minimumCount...ClientCount.maximunCount
        let randomNumber = Int.random(in: clientRange)
        
        for _ in 0..<randomNumber {
            let client = Client()
            clients.append(client)
        }
        return clients
    }
}
