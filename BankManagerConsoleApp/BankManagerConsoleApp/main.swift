//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

final class Bank {
    let task = Task()
    let creditRatings: [creditRating] = [.vvip, .vip, .normal]
    let typeOfWorks: [workType] = [.deposit, .loan]
    var waitingLine: [Task] = []
    let bankWindow = OperationQueue()
    
    func serveClient() {
        while true {
            bankWindow.maxConcurrentOperationCount = 3
            var workTime = Double.zero
            displayMenu()
            let menuNumber = inputMenuNumber()
            switch menuNumber {
            case 1:
                var taskList: [Task] = []
                let totalCustomer = customerNumber()
                for waitNumber in 1...totalCustomer {
                    let randomClientAttribute = acceeptRandomClient()
                    let taskPerClient = Task()
                    taskPerClient.waitingNumber = waitNumber
                    taskPerClient.creditRate = creditRatings[randomClientAttribute.0]
                    taskPerClient.typeOfWork = typeOfWorks[randomClientAttribute.1]
                    assignPriority(taskPerClient)
                    taskList.append(taskPerClient)
                    taskPerClient.completionBlock = {
                        guard let typeOfTask = taskPerClient.typeOfWork else { return }
                        workTime += typeOfTask.duration
                    }
                }
                bankWindow.addOperations(taskList, waitUntilFinished: true)
                print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은\(String(format: "%.2f", workTime))초 입니다.")
                continue
            case 2:
                exit(0)
            default:
                print("잘못된 입력")
                continue
            }
        }
    }

    private func displayMenu() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력", terminator: " : " )
    }

    private func inputMenuNumber() -> Int {
        guard let optionalInput = readLine(), let inputNumber = Int(optionalInput) else {
            return 0
        }
        return inputNumber
    }

    private func customerNumber() -> Int {
        return Int.random(in: 10...30)
    }
    
    private func acceeptRandomClient() -> (Int, Int) {
        let creditRate = Int.random(in: 0...2)
        let typeOfWork = Int.random(in: 0...1)
        
        return (creditRate, typeOfWork)
    }
    
    private func assignPriority(_ task: Task) {
        guard let rate = task.creditRate else { return }
        switch rate {
        case .vvip:
            return task.qualityOfService = .userInteractive
        case .vip:
            return task.qualityOfService = .userInitiated
        case .normal:
            return task.qualityOfService = .default
        }
    }
}

Bank().serveClient()
