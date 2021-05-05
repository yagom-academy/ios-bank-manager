//
//  BankingTask.swift
//  BankManagerConsoleApp
//
//  Created by Yunhwa on 2021/05/05.
//

import Foundation

final class BankingTask: Operation {
    // MARK: - Properties
    var owner: Client?
    private let type: TaskType
    
    init(_ type: TaskType) {
        self.type = type
    }
    
    // MARK: - Private Method
    func startTask() throws -> String {
        guard let owner: Client = owner else {
            throw BankManagerError.ownerNotAssigned
        }
        
        return "💸 \(owner.waitingNumber)번 \(owner.grade.name)고객 \(type.name)업무 시작."
    }
    
    func endTask() throws -> String {
        guard let owner: Client = owner else {
            throw BankManagerError.ownerNotAssigned
        }
        
        return "✅ \(owner.waitingNumber)번 \(owner.grade.name)고객 \(type.name)업무 완료!"
    }
    
    // MARK: - Override Method from the Operation Class
    override func main() {
        do {
            let startTaskText: String = try startTask()
            let endTaskText: String = try endTask()
            
            print(startTaskText)
            Thread.sleep(forTimeInterval: type.processTime)
            print(endTaskText)
        } catch {
            print(error)
        }
    }
}

// MARK: - NameSpaces
extension BankingTask {
    enum TaskType: CaseIterable {
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
        
        static var random: TaskType {
            guard let randomTask: TaskType = TaskType.allCases.randomElement() else {
                return .deposit
            }
            return randomTask
        }
    }
}
