//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

final class Bank {
    let client = Client()
    let creditRatings: [creditRating] = [.vvip, .vip, .normal]
    let typeOfWorks: [workType] = [.deposit, .loan]
    var vvipQueue: [Client] = []
    var vipQueue: [Client] = []
    var normalQueue: [Client] = []

    let bankWindow1 = OperationQueue()
    let bankWindow2 = OperationQueue()
    let bankWindow3 = OperationQueue()
    
    
    func serveClient() {
        while true {
            bankWindow1.maxConcurrentOperationCount = 3
            //        bankWindow2.maxConcurrentOperationCount = 1
            //        bankWindow3.maxConcurrentOperationCount = 1
            var workTime = Double.zero
            displayMenu()
            let menuNumber = inputMenuNumber()
            switch menuNumber {
            case 1:
                var clientWaitLine: [Client] = []
                let totalCustomer = customerNumber()
                for waitNumber in 1...totalCustomer {
                    let randomClientAttribute = acceeptRandomClient()
                    let client = Client()
                    client.waitingNumber = waitNumber
                    client.creditRate = creditRatings[randomClientAttribute.0]
                    client.typeOfWork = typeOfWorks[randomClientAttribute.1]
                    assignPriority(client)
                    clientWaitLine.append(client)
                    //                    setPriority(client)
                    client.completionBlock = {
                        guard let typeOfTask = client.typeOfWork else { return }
                        workTime += typeOfTask.duration
                    }
                }
                bankWindow1.addOperations(clientWaitLine, waitUntilFinished: true)
                //                bankWindow1.addOperations(vipQueue, waitUntilFinished: false)
                //                bankWindow1.addOperations(normalQueue, waitUntilFinished: true)
                
                //                scheduleService()
                //                sleep(20)
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
    
    private func assignPriority(_ client: Client) {
        guard let rate = client.creditRate else { return }
        switch rate {
        case .vvip:
            return client.qualityOfService = .userInteractive
        case .vip:
            return client.qualityOfService = .userInitiated
        case .normal:
            return client.qualityOfService = .default
        }
    }
    
//    private func setPriority(_ client: Client) {
//        guard let rate = client.creditRate else { return }
//        switch rate {
//        case .vvip:
//            vvipQueue.append(client)
//        case .vip:
//            vipQueue.append(client)
//        case .normal:
//            normalQueue.append(client)
//        }
//    }
    
//    private func scheduleService() {
//        while !vvipQueue.isEmpty || !vipQueue.isEmpty || !normalQueue.isEmpty {
//            if vvipQueue.isEmpty == false {
//                if bankWindow1.operationCount == 0 {
//                    bankWindow1.addOperation(vvipQueue.removeFirst())
//                    continue
//                } else if bankWindow2.operationCount == 0 {
//                    bankWindow2.addOperation(vvipQueue.removeFirst())
//                    continue
//                } else if bankWindow3.operationCount == 0 {
//                    bankWindow3.addOperation(vvipQueue.removeFirst())
//                    continue
//                } else {
//                    bankWindow1.addOperation(vvipQueue.removeFirst())
//                    continue
//                }
//            } else if vipQueue.isEmpty == false {
//                if bankWindow1.operationCount == 0 {
//                    bankWindow1.addOperation(vipQueue.removeFirst())
//                    continue
//                } else if bankWindow2.operationCount == 0 {
//                    bankWindow2.addOperation(vipQueue.removeFirst())
//                    continue
//                } else if bankWindow3.operationCount == 0 {
//                    bankWindow3.addOperation(vipQueue.removeFirst())
//                    continue
//                } else {
//                    bankWindow1.addOperation(vipQueue.removeFirst())
//                    continue
//                }
//            } else {
//                if bankWindow1.operationCount == 0 {
//                    bankWindow1.addOperation(normalQueue.removeFirst())
//                    continue
//                } else if bankWindow2.operationCount == 0 {
//                    bankWindow2.addOperation(normalQueue.removeFirst())
//                    continue
//                } else if bankWindow3.operationCount == 0 {
//                    bankWindow3.addOperation(normalQueue.removeFirst())
//                    continue
//                } else {
//                    bankWindow1.addOperation(normalQueue.removeFirst())
//                    continue
//                }
//            }
//        }
//    }
}


Bank().serveClient()
