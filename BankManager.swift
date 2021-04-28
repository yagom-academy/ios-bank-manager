//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct MenuPrinter {
    enum MenuPhrase {
        static let bankOpen = "1 : 은행개점"
        static let exit = "2 : 종료"
        static let input = "입력 : "
    }
    
    static func printMenu() {
        print(MenuPhrase.bankOpen)
        print(MenuPhrase.exit)
        print(MenuPhrase.input, terminator:"")
    }
}

struct Inputer {
    enum StringConstant {
        static let blank = ""
    }
    
    static func receive() -> String {
        guard let input = readLine() else {
            return StringConstant.blank
        }
        return input
    }
}

class Bank {
    private var bankManager: BankManager
    
    init() {
        bankManager = BankManager(numberOfBanker: 1)
    }
    
    private func startWork() {
        let startTime = CFAbsoluteTimeGetCurrent()
        bankManager.inputCustomersToWaitingLine()
        let endTime = CFAbsoluteTimeGetCurrent()
        print(endTime - startTime)
    }
    
    func open() {
        while (true) {
            MenuPrinter.printMenu()
            let input = Inputer.receive()
            switch input {
            case "1":
                startWork()
            case "2":
                return
            default:
                print("잘못된 입력입니다. 다시 입력해주세요.")
            }
        }
    }
}

class BankManager {
    private var numberOfBanker: Int
    private var waitingLine: OperationQueue
    private var customerMaker: CustomerMaker
    
    init(numberOfBanker: Int) {
        self.numberOfBanker = numberOfBanker
        waitingLine = OperationQueue()
        customerMaker = CustomerMaker()
        waitingLine.maxConcurrentOperationCount = self.numberOfBanker
    }
    
    func inputCustomersToWaitingLine() {
        customerMaker.makeCustomers().forEach{ waitingLine.addOperation($0.bankTask) }
        waitingLine.waitUntilAllOperationsAreFinished()
    }
}

class Customer {
    private var _bankTask: BankTask
    private var waitingNumber: Int
    var bankTask: BankTask {
        return _bankTask
    }
    
    init(waitingNumber: Int) {
        self._bankTask = BankTask(taskTime: 0.7, waitingNumber)
        self.waitingNumber = waitingNumber
    }
}

class CustomerMaker {
    private var numberOfCustomer: Int
    
    init() {
        self.numberOfCustomer = Int.random(in: 10...30)
    }
    
    func makeCustomers() -> [Customer] {
        var customers: [Customer] = []
        for i in 1...numberOfCustomer {
            customers.append(Customer(waitingNumber: i))
        }
        return customers
    }
}

class BankTask: Operation {
    private var taskTime: Double
    private var waitingNumber: Int
    
    init(taskTime: Double, _ waitingNumber: Int) {
        self.taskTime = taskTime
        self.waitingNumber = waitingNumber
    }
    
    override func main() {
        print(waitingNumber, "번 고객 업무 시작")
        Thread.sleep(forTimeInterval: taskTime)
        print(waitingNumber, "번 고객 업무 완료")
    }
}
