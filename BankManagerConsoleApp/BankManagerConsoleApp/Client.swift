//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by Yun, Ryan on 2021/04/27.
//

import Foundation

class Client: Operation {
    // MARK: - Properties
    let waitingNumber: Int
    let grade: Grade
    let task: Task
    
    init(_ waitingNumber: Int) {
        self.waitingNumber = waitingNumber
        self.grade = Grade.random
        self.task = Task.random
    }
    
    // MARK: - Private Method
    func startTask() -> String {
        return "\(waitingNumber)번 \(grade.name) 고객 \(task.name)업무 시작."
    }
    
    func endTask() -> String {
        return "\(waitingNumber)번 \(grade.name) 고객 \(task.name)업무 종료!"
    }
    
    // MARK: - Override Method from the Operation Class
    override func main() {
        let startTaskText: String = startTask()
        let endTaskText: String = endTask()
        
        print(startTaskText)
        Thread.sleep(forTimeInterval: task.processTime)
        print(endTaskText)
    }
}

// MARK: - NameSpaces
extension Client {
    enum Grade: CaseIterable, Comparable {
        case vvip
        case vip
        case normal
        
        var name: String {
            switch self {
            case .vvip:
                return "VVIP"
            case .vip:
                return "VIP"
            case .normal:
                return "일반"
            }
        }
        
        static var random: Grade {
            guard let randomGrade: Grade = Grade.allCases.randomElement() else {
                return .normal
            }
            return randomGrade
        }
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
    
}
