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
    
    var role: TaskCategory
    
    init(role: TaskCategory) {
        self.role = role
    }
    
    // MARK:- private Method
    private func showMessage(taskMessage: TaskMessage, number: UInt) {
        print(taskMessage.notifyMessage(by: number))
    }
    
    // MARK:- internal Method
    func handleTask(with client: Client) {
        guard let queueTicket = client.submitQueueTicket() else {
            return
        }
        
        showMessage(taskMessage: .beginning, number: queueTicket)
        Thread.sleep(forTimeInterval: client.task.taskTime)
        showMessage(taskMessage: .completion, number: queueTicket)
    }
}
