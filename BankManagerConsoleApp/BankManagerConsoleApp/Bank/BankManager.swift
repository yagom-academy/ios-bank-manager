//
//  BankManager.swift
//  BankManagerConsoleApp

import Foundation

struct BankManager {
    private var bank: Bankable
    private(set) var isRunning: Bool = true
    private var customers: [Customer] = []
    
    init(bank: Bankable) {
        self.bank = bank
    }
    
    mutating func run(_ customers: [Customer]) throws {
        self.customers = customers
        
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
            let totalExecutionTime: Double = open()
            close(totalExecutionTime)
        case Constant.closeBank:
            isRunning = false
            return
        default:
            throw BankError.invalidInput
        }
    }
    
    mutating private func open() -> Double {
        bank.resetHandledCustomerCount()
        
        for customer in customers {
            bank.addCustomer(customer)
        }
        
        let serviceStartTime = DispatchTime.now().uptimeNanoseconds
        
        for _ in 0..<customers.count {
            bank.allocateCustomer()
        }
        
        bank.bankingServiceGroup.wait()
        
        let serviceEndTime = DispatchTime.now().uptimeNanoseconds
        
        return Double(serviceEndTime - serviceStartTime) / 1_000_000_000
    }
    
    private func close(_ totalExecutionTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(bank.handledCustomerCount)명이며, 총 업무시간은 \(String(format: "%.2f", totalExecutionTime))초 입니다.")
    }
}
