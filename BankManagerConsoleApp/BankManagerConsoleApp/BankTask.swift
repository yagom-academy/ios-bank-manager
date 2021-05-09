//
//  BankTask.swift
//  BankManagerConsoleApp
//
//  Created by 배은서 on 2021/04/30.
//

import Foundation

class BankTaskOperation: Operation {
    private let waitingNumber: Int
    private let clientRating: String
    private var taskTime: Double = 0
    
    init(_ waitingNumber: Int, _ clientRating: String, _ priority: QueuePriority) {
        self.waitingNumber = waitingNumber
        self.clientRating = clientRating
        super.init()
        super.queuePriority = priority
    }
    
    enum TaskType: String, CustomStringConvertible, CaseIterable {
        case loan, deposit
            
        var description: String {
            switch self {
            case .loan:
                return "대출업무"
            case .deposit:
                return "예금업무"
            }
        }
            
        var time: Double {
            switch self {
            case .loan:
                return 1.1
            case .deposit:
                return 0.7
            }
        }
    }
    
    override func main() {
        do {
            let task = try createTask()
            print("\(waitingNumber)번 \(clientRating)고객 \(task) 시작")
            Thread.sleep(forTimeInterval: taskTime)
            print("\(waitingNumber)번 \(clientRating)고객 \(task) 완료")
        } catch let error {
            print("\(error.localizedDescription)")
        }
    }
    
    private func createTask() throws -> TaskType {
        guard let task = TaskType.allCases.randomElement() else { throw BankError.invalidTask }
        taskTime = task.time
        
        return task
    }
    
    func getTaskTime() -> Double {
        return taskTime
    }
}
