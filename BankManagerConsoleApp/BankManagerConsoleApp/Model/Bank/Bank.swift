//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Zion, Whales on 2023/07/12.
//

import Foundation

final class Bank {
    let bankManagerCount: Int
    var clientQueue = Queue<Client>()
    let bankManger = BankManager()
    
    init(bankManagerCount: Int) {
        self.bankManagerCount = bankManagerCount
    }
    
    func open() {
        print("1 : 은행개점\n2 : 종료\n입력", terminator: " : ")
        let input = readLine()
        
        switch input {
        case "1":
            startTask()
        default:
            return
        }
    }
    
    private func startTask() {
        let group = DispatchGroup()
        let depositSemaphore = DispatchSemaphore(value: 2)
        let loanSemaphore = DispatchSemaphore(value: 1)
        let clientCount = Int.random(in: 10...30)
        let startTime = Date()
        
        setUpClientQueue(count: clientCount)
        
        while !clientQueue.isEmpty {
            guard let client = clientQueue.dequeue() else { break }
            
            if client.banking == .deposit {
                depositSemaphore.wait()
                DispatchQueue.global().async(group: group) {
                    self.bankManger.work(client: client)
                    depositSemaphore.signal()
                }
            } else {
                loanSemaphore.wait()
                DispatchQueue.global().async(group: group) {
                    self.bankManger.work(client: client)
                    loanSemaphore.signal()
                }
            }
        }
        
        group.wait()
        printTaskResult(clientCount, startTime)
        open()
    }
    
    private func printTaskResult(_ clientCount: Int, _ startTime: Date) {
        let totalWorkTime = Date().timeIntervalSince(startTime)
        let formattedWorkTime = String(format: "%.2f", totalWorkTime)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, 총 업무시간은 \(formattedWorkTime)초입니다.")
    }
    
    private func setUpClientQueue(count: Int) {
        var client: Client
        var bankingType: BankingType
        
        for turn in 1...count {
            bankingType = BankingType.allCases.randomElement() ?? .deposit
            client = Client(turn, bankingType)
            clientQueue.enqueue(client)
        }
    }
}
