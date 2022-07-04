//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Kiwi, Kay on 2022/07/01.
//
import Foundation

class Bank {
    var bankManagers: Array<BankManager> = []
    var lineOfCustomers = BankManagerQueue<Customer>()
    var numberOfCustomers: Int = 0
    var totalTimeOfWork: Double = 0.0
    
    func inputMenu() {
        print("1 : 은행 개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    func generateRandomNumberOfCustomers() {
        numberOfCustomers = Int.random(in: 10...30)
    }
    
    func insertCustomersIntoQueue() {
        for element in 1...self.numberOfCustomers {
            let random = Int.random(in: 0...1)
            let customer = Customer(customerNumber: element, business: WorkType.allCases[random])
            self.lineOfCustomers.enqueue(data: customer)
        }
    }
    
    func distributeTask () {
        for worker in bankManagers {
            worker.handleCustomers()
        }
    }
    
    func makeThreeBankers() -> [BankManager] {
        let banker1 = BankManager(bank: self, specialized: .deposit)
        let banker2 = BankManager(bank: self, specialized: .deposit)
        let banker3 = BankManager(bank: self, specialized: .loan)
        return [banker1, banker2, banker3]
    }
    
    func openBank() {
        self.bankManagers = makeThreeBankers()
        DispatchQueue.global().sync {
            var userInput: String?
            repeat {
                self.inputMenu()
                userInput = readLine()
                if let input = userInput {
                    if input == "1" {
                        self.generateRandomNumberOfCustomers()
                        self.insertCustomersIntoQueue()
                        self.distributeTask()
                        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomers)명이며, 총 업무시간은 \(String(format: "%.2f", totalTimeOfWork))초 입니다.")
                        totalTimeOfWork = 0.0
                    }
                }
            } while userInput != "2"
        }
    }
}
