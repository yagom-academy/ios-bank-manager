//
//  BankManager.swift
//  BankManagerConsoleApp

import Foundation

struct BankManager {
    private var bank: Bank = Bank(numberOfClerks: 1)
    private var timePerTask: Double = 0.7
    private(set) var isRunning: Bool = true
    
    mutating func run() throws {
        printMenu()
        
        let userInput = readLine()
        try identifyMenu(userInput)
    }
    
    private func printMenu() {
        print(
            """
            1 : 은행개점
            2 : 종료
            입력
            """,
            terminator: " : ")
    }
    
    mutating private func identifyMenu(_ userInput: String?) throws {
        switch userInput {
        case Constant.openBank:
            open()
            try close()
        case Constant.closeBank:
            isRunning = false
            return
        default:
            throw BankError.invalidInput
        }
    }
    
    mutating private func createCustomer() -> Int {
        let customers: Int = Int.random(in: Constant.customerNumberRange)
        
        for number in 1...customers {
            let customer: Customer = Customer(waitingNumber: number)
            bank.addCustomer(customer)
        }
        
        return customers
    }
    
    mutating private func open() {
        let customers: Int = createCustomer()
        
        for _ in 1...customers {
            bank.performTask()
        }
    }
    
    private func close() throws {
        let totalTime: String = try (Double(bank.finishedCustomerCount) * timePerTask).format()
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(bank.finishedCustomerCount)명이며, 총 업무시간은 \(totalTime)초 입니다.")
    }
}
