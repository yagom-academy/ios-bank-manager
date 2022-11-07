//
//  BankManager.swift
//  BankManagerConsoleApp

import Foundation

struct BankManager {
    private var bank: Bank = Bank()
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
            try open()
            bank.dispatchGroup.wait()
            try close()
        case Constant.closeBank:
            isRunning = false
            return
        default:
            throw BankError.invalidInput
        }
    }
    
    mutating private func createCustomer() throws -> Int {
        let customers: Int = Int.random(in: Constant.customerNumberRange)
        
        for number in 1...customers {
            guard let banking: BankService = BankService.allCases.randomElement() else {
                throw BankError.invalidService
            }
            let customer: Customer = Customer(waitingNumber: number, banking: banking)
            bank.addCustomer(customer)
        }
        
        return customers
    }
    
    mutating private func open() throws {
        let customers: Int = try createCustomer()
        bank.resetFinishedCustomerCount()
        
        for _ in 1...customers {
            bank.allocateCustomer()
        }
    }
    
    private func close() throws {
        let totalTime: String = try format(time: (Double(bank.finishedCustomerCount) * Double(bank.timePerTask) * Constant.micro))
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(bank.finishedCustomerCount)명이며, 총 업무시간은 \(totalTime)초 입니다.")
    }
    
    private func format(time: Double) throws -> String {
        let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
            
            return formatter
        }()
        
        guard let result = formatter.string(for: time) else {
            throw BankError.formattingError
        }
        
        return result
    }
}
