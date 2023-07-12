//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/12.
//

import Foundation

struct Bank {
    private let bankClerk: BankClerk
    private let customerCount: Int
    private var waitingLine = Queue<Customer>()
    
    init(bankClerk: BankClerk, customerCount: Int) {
        self.bankClerk = bankClerk
        self.customerCount = customerCount
    }
    
    func start() {
        print("1 : 은행 개점")
        print("2 : 종료")
        print("입력 :", terminator: " ")
        
        selectMenu()
    }
    
    private func selectMenu() {
        guard let userInput = readLine() else { return }
        
        switch userInput {
        case "1":
            updateWaitingLine()
            startBankService()
        case "2":
            return
        default:
            print("잘못된 입력입니다.")
        }
        
        start()
    }
    
    private func updateWaitingLine() {
        (1...customerCount).forEach {
            waitingLine.enqueue(Customer(waitingNumber: $0, taskTime: 0.7))
        }
    }
    
    private func startBankService() {
        let startTime = Date()
        
        while !waitingLine.isEmpty {
            if let customerTurn = waitingLine.dequeue() {
                bankClerk.carryOutBankService(customerTurn)
            }
        }
        
        let totalTaskTime = Date().timeIntervalSince(startTime)
        let formatTaskTime = String(format: "%.2f", totalTaskTime)
        
        finish(formatTaskTime)
    }
    
    private func finish(_ taskTime: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(taskTime)초입니다.")
    }
}
