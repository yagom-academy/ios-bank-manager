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
        
        func notifyMessage(by number: UInt, taskName: String) -> String {
            switch self {
            case .beginning:
                return "\(number)번 고객 \(taskName)업무 시작"
            case .completion:
                return "\(number)번 고객 \(taskName)업무 완료"
            }
        }
    }
    
    var role: TaskCategory
    
    init(role: TaskCategory) {
        self.role = role
    }
    
    // MARK:- private Method
    private func showMessage(taskMessage: TaskMessage, number: UInt, task: TaskCategory) {
        print(taskMessage.notifyMessage(by: number, taskName: task.name))
    }
    
    // MARK:- internal Method
    func handleTask(with client: Client) {
        guard let queueTicket = client.submitQueueTicket() else {
            return
        }
        
        showMessage(taskMessage: .beginning, number: queueTicket, task: client.task)
        Thread.sleep(forTimeInterval: client.task.taskTime)
        showMessage(taskMessage: .completion, number: queueTicket, task: client.task)
    }
}
