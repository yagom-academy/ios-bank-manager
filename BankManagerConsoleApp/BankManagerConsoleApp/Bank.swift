//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

final class Bank {
    enum Constant {
        static let startMessage = "번 고객 업무 시작"
        static let endMessage = "번 고객 업무 종료"
        static let workTime = 0.7
    }
    private var queue = Queue(list: LinkedList<Client>())
    private let clerk = DispatchQueue(label: "clerkDispatchQueue")
    
    func executeBankWork() {
        let work = DispatchWorkItem {
            self.serveClients()
        }
        receiveClients()
        clerk.sync(execute: work)
    }
    
    func receiveClients() {
        for order in 1...Int.random(in: 10...30) {
            queue.enqueue(Client(order))
        }
    }
    
    func serveClients() {
        let start = CFAbsoluteTimeGetCurrent()
        let numberOfClients = queue.count
        while !queue.isEmpty {
            dealWithClient()
        }
        let interval = CFAbsoluteTimeGetCurrent() - start
        let totalTime = String(format: "%.2f", interval)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClients)명이며, 총 업무시간은 \(totalTime)입니다.")
    }
    
    func dealWithClient() {
        guard let client = queue.dequeue() else {
            return
        }
        print("\(client.orderNumber)\(Constant.startMessage)")
        Thread.sleep(forTimeInterval: Constant.workTime)
        print("\(client.orderNumber)\(Constant.endMessage)")
    }
}
