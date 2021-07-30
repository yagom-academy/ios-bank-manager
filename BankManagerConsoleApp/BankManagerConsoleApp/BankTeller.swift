//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by Jost, Hosinging on 2021/07/30.
//

import Foundation

class BankTeller {
    enum TaskMessage {
        case beginning
        case completion
        
        func notifyMessage(by number: UInt) -> String {
            switch self {
            case .beginning:
                return "\(number)번 고객 업무 시작"
            case .completion:
                return "\(number)번 고객 업무 완료"
            }
        }
    }
    
    private func showMessage(taskMessage: TaskMessage, number: UInt) {
        print(taskMessage.notifyMessage(by: number))
    }
    
    func handleTask(with client: Client) {
        guard let queueTicket = client.submitQueueTicket() else {
            return
        }
        
        showMessage(taskMessage: .beginning, number: queueTicket)
        for task in client.tasks {
            Thread.sleep(forTimeInterval: task.getTaskTime())
        }
        showMessage(taskMessage: .completion, number: queueTicket)
    }
}
