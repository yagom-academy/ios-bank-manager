//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by 편대호 on 2021/07/30.
//

import Foundation

class BankTeller {
    enum TaskMessage {
        case beginning
        case completion
        
        func showMessage(number: UInt) -> String {
            switch self {
            case .beginning:
                return "\(number)번 고객 업무 시작"
            case .completion:
                return "\(number)번 고객 업무 완료"
            }
        }
    }
    
    func handleTask(with client: Client) {
        guard let queueTicket = client.submitQueueTicket() else {
            return
        }
        
        print(TaskMessage.beginning.showMessage(number: queueTicket))
        for task in client.tasks {
            Thread.sleep(forTimeInterval: task.getTaskTime())
        }
        print(TaskMessage.completion.showMessage(number: queueTicket))
    }
}
