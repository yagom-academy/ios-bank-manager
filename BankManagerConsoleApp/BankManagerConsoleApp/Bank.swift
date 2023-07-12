//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/12.
//

import Foundation

struct Bank {
    let bankClerks: BankClerk
    private var waitingLine = Queue<Customer>()
    private let customerCount = Int.random(in: 10...30)
    
    func start() {
        print("1 : 은행 개점")
        print("2 : 종료")
        print("입력 :", terminator: " ")
        
        selectMenu()
    }
    
    func selectMenu() {
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
        let startTime = CFAbsoluteTimeGetCurrent()
        
        while !waitingLine.isEmpty {
            if let customerTurn = waitingLine.dequeue() {
                bankClerks.carryOutBankService(customerTurn)
            }
        }
        
        let totalTaskTime = CFAbsoluteTimeGetCurrent() - startTime
        let formatTaskTime = String(format: "%.2f", totalTaskTime)
        
        finish(customerCount, formatTaskTime)
    }
    
    private func finish(_ customerCount: Int, _ taskTime: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(taskTime)초입니다.")
    }
}
