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
    
    init(_ waitingNumber: Int) {
        self.waitingNumber = waitingNumber
        self.grade = Grade.random
    }
    
    // MARK: - NameSpaces
    private enum TimeForProcessingTask {
        static let deposit: Double = 0.7
    }
    
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
    
    // MARK: - Private Method
    func startTask() -> String {
        return "\(waitingNumber)번 \(grade.name) 고객 업무 시작."
    }
    
    func endTask() -> String {
        return "\(waitingNumber)번 \(grade.name) 고객 업무 종료!"
    }
    
    // MARK: - Override Method from the Operation Class
    override func main() {
        let startTaskText: String = startTask()
        let endTaskText: String = endTask()
        
        print(startTaskText)
        Thread.sleep(forTimeInterval: TimeForProcessingTask.deposit)
        print(endTaskText)
    }
}

