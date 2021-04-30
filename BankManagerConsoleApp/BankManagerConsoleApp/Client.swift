//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by Yun, Ryan on 2021/04/27.
//

import Foundation

final class Client: Operation {
    // MARK: - Properties
    let waitingNumber: Int
    
    init(_ waitingNumber: Int) {
        self.waitingNumber = waitingNumber
    }
    
    // MARK: - NameSpaces
    private enum TimeForProcessingTask {
        static let deposit: Double = 0.7
    }
    
    // MARK: - Override Method from the Operation Class
    override func main() {
        print("\(waitingNumber) 번 고객 업무 시작.")
        Thread.sleep(forTimeInterval: TimeForProcessingTask.deposit)
        print("\(waitingNumber) 번 고객 업무 종료!")
    }
}

