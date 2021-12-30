//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Jun Bang on 2021/12/24.
//

import Foundation

struct Bank {
    //MARK: - 저장 속성
    private var loanClientQueue = WaitingQueue<Client>()
    private var depositClientQueue = WaitingQueue<Client>()
    private var loanClerkQueue = WaitingQueue<BankClerk>()
    private var depositClerkQueue = WaitingQueue<BankClerk>()
    
    //MARK: - 생성자
    init(numberOfClerksForLoans: Int, numberOfClerksForDeposits: Int) {
        (0..<numberOfClerksForLoans).forEach { _ in
            let clerk = BankClerk(taskResponsibility: .loan)
            loanClerkQueue.enqueue(clerk)
        }
        
        (0..<numberOfClerksForDeposits).forEach { _ in
            let clerk = BankClerk(taskResponsibility: .deposit)
            depositClerkQueue.enqueue(clerk)
        }
    }
    
    // MARK: - Internal 메서드
    mutating func receive(clients: [Client]) {
        clients.forEach { client in
            switch client.task {
            case .loan:
                loanClientQueue.enqueue(client)
            case .deposit:
                depositClientQueue.enqueue(client)
            }
        }
    }
    
    mutating func executeBusiness() {
        let startTime = CFAbsoluteTimeGetCurrent()
        let totalClientCount = handleClients()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        
        showClosingMessage(with: totalClientCount, and: processTime)
    }
    
    //MARK: - Private 메서드
    private mutating func handleClients() -> Int {
        var totalHandledClientCount: Int = 0
        
//        while let client = clientQueue.dequeue(),
//              var clerk = clerkQueue.dequeue() {
//            if clerk.isAvailable {
//                clerk.work(for: client)
//                totalHandledClientCount += 1
//            }
//            clerkQueue.enqueue(clerk)
//        }
        
        return totalHandledClientCount
    }
    
    private func showClosingMessage(with totalHandledClientCount: Int, and processTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalHandledClientCount)명이며, 총 업무시간은 \(processTime.secondDecimalFormat)초입니다.")
    }
}

//MARK: - 중첩타입
extension Bank {
    private struct BankClerk {
        var isAvailable = true
        let taskResponsibility: Task
        
        mutating func work(for client: Client) {
            let clientOrderNumber = client.orderTicket.number
            let duration = client.taskDuration
            
            isAvailable = false
            print("\(clientOrderNumber)번 고객 \(client.task)업무 시작")
            Thread.sleep(forTimeInterval: duration)
            print("\(clientOrderNumber)번 고객 \(client.task)업무 완료")
            isAvailable = true
        }
    }
}
