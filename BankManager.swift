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
    private func inputFromUser() throws -> Menu {
        showMenu()
        guard let input = readLine(),
              let inputNumber = Int(input),
              let menuNumber = Menu(rawValue: inputNumber) else {
            throw BankManagerErrorMessage.wrongInput
        }
        return menuNumber
    }
    
    private func executeBankBusiness() {
        let clients = generateClients()
        bank.receiveClient(clients: clients)
        bank.readyForWork()
        let (numberOfClient, totalTaskTime): TaskReport = bank.doTask()
        showClosingMessage(numberOfClient: numberOfClient, totalTaskTime: totalTaskTime)
        bank.finishWork()
    }
    
    func run() {
        do {
            while true {
                let userInput = try inputFromUser()
                switch userInput {
                case .openingBank:
                    executeBankBusiness()
                case .exit:
                    return
                }
            }
        } catch let error as BankManagerErrorMessage {
            showErrorDescription(message: error)
        } catch {
            print("예기치 못한 오류 발생. 프로그램을 종료합니다.")
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
    
    private func showErrorDescription(message: BankManagerErrorMessage) {
        guard let errorDescription = message.errorDescription else {
            return
        }
        print(errorDescription)
    }
    
    private func showClosingMessage(numberOfClient: UInt, totalTaskTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient)명이며, 총 업무시간은 \(String(format: "%.2f", totalTaskTime))초 입니다.")
    }
}

// MARK:- ETC. private Methods
extension BankManager {
    private func generateClients() -> [Client] {
        var clients: [Client] = []
        let clientRange = ClientCount.minimumCount...ClientCount.maximunCount
        let randomNumber = Int.random(in: clientRange)
        
        for _ in 0..<randomNumber {
            let client = Client(task: .defaultTask)
            clients.append(client)
        }
        return clients
    }
}
