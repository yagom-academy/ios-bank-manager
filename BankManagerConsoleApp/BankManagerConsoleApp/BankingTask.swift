//
//  BankingTask.swift
//  BankManagerConsoleApp
//
//  Created by Yunhwa on 2021/05/05.
//

import Foundation

final class BankingTask: Operation {
    var owner: Client?
    let type: Task
    
    override init() {
        self.type = Task.random
        super.init()
    }
    
    enum Task: CaseIterable {
        case deposit
        case loan
        
        var name: String {
            switch self {
            case .deposit:
                return "예금"
            case .loan:
                return "대출"
            }
        }
        
        var processTime: Double {
            switch self {
            case .deposit:
                return 0.7
            case .loan:
                return 1.1
            }
        }
        
        static var random: Task {
            guard let randomTask: Task = Task.allCases.randomElement() else {
                return .deposit
            }
            return randomTask
        }
    }
    
    // MARK: - Private Method
    func startTask() -> String {
        return "\(owner!.waitingNumber)번 \(owner!.grade.name) 고객 \(type.name)업무 시작."
    }
    
    func endTask() -> String {
        return "\(owner!.waitingNumber)번 \(owner!.grade.name) 고객 \(type.name)업무 종료!"
    }
    
    // MARK: - Override Method from the Operation Class
    override func main() {
        let startTaskText: String = startTask()
        let endTaskText: String = endTask()
        
        print(startTaskText)
        Thread.sleep(forTimeInterval: type.processTime)
        print(endTaskText)
    }
}
