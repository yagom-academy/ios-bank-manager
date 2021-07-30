//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Jost, Hosinging on 2021/07/29.
//

import Foundation

class Bank {
    enum TaskMessage {
        case beginning
        case completion
        
        func showMessage(number: Int) -> String {
            switch self {
            case .beginning:
                return "\(number)번 고객 업무 시작"
            case .completion:
                return "\(number)번 고객 업무 완료"
            }
        }
    }
    
    var clientQueue: Queue<Client> = Queue<Client>()
    var bankTellerQueue: Queue<BankTeller> = Queue<BankTeller>()
    var openingHour: TimeInterval = 0
    var closingHour: TimeInterval = 0
    var numberOfClient: UInt = 0
    
    init(numberOfBankTeller: UInt = 1) {
        for _ in 1...numberOfBankTeller {
            bankTellerQueue.enqueue(value: BankTeller())
        }
    }
    
    func finishWork() {
        
    }
    
    func showClosingMessage() {
        
    }
    
    func receiveClient() {
        
    }
    
    func doTask() {
        
    }
}
