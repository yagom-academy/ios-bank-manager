//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Jun Bang on 2021/12/24.
//

import Foundation

class Bank {
    //MARK: - 저장 속성
    private let loanClientQueue = WaitingQueue<Client>()
    private let depositClientQueue = WaitingQueue<Client>()
    private let numberOfClerksForLoans: Int
    private let numberOfClerksForDeposits: Int
    
    init(numberOfClerksForLoans: Int, numberOfClerksForDeposits: Int) {
        self.numberOfClerksForLoans = numberOfClerksForLoans
        self.numberOfClerksForDeposits = numberOfClerksForDeposits
    }
    
    // MARK: - Internal 메서드
    func receive(clients: [Client]) {
        clients.forEach { client in
            switch client.task {
            case .loan:
                loanClientQueue.enqueue(client)
            case .deposit:
                depositClientQueue.enqueue(client)
            }
        }
    }
    
    func executeBusiness() {
        let startTime = CFAbsoluteTimeGetCurrent()
        let totalClientCount = handleClients()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        
        showClosingMessage(with: totalClientCount, and: processTime)
    }
    
    //MARK: - Private 메서드
    private func handleClients() -> Int {
        let loanWindow = BankWindow(task: .loan, with: numberOfClerksForLoans)
        let depositWindow = BankWindow(task: .deposit, with: numberOfClerksForDeposits)
        
        let loanClientCount = loanWindow.handle(clients: loanClientQueue)
        let depositClientCount = depositWindow.handle(clients: depositClientQueue)
        let totalHandledClientCount = loanClientCount + depositClientCount
        
        return totalHandledClientCount
    }
    
    private func showClosingMessage(with totalHandledClientCount: Int, and processTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalHandledClientCount)명이며, 총 업무시간은 \(processTime.secondDecimalFormat)초입니다.")
    }
}

//MARK: - 중첩타입
extension Bank {
    private class BankWindow {
        let task: Task
        let numberOfClerks: Int
        
        init(task: Task, with numberOfClerks: Int) {
            self.task = task
            self.numberOfClerks = numberOfClerks
        }
        
        func handle(clients queue: WaitingQueue<Client>) -> Int {
            var totalHandledClientCount = 0
            let clientCountingSemaphore = DispatchSemaphore(value: 1)
            let semaphore = DispatchSemaphore(value: numberOfClerks)
            let group = DispatchGroup()
            
            DispatchQueue.global().async(group: group) {
                while let loanClient = queue.dequeue() {
                    DispatchQueue.global().async(group: group) {
                        semaphore.wait()
                        self.work(for: loanClient)
                        semaphore.signal()

                        clientCountingSemaphore.wait()
                        totalHandledClientCount += 1
                        clientCountingSemaphore.signal()
                    }
                }
            }
            group.wait()
            
            return totalHandledClientCount
        }
        
        private func work(for client: Client) {
            let clientOrderNumber = client.orderTicket.number
            let duration = client.taskDuration
            
            print("\(clientOrderNumber)번 고객 \(task)업무 시작")
            Thread.sleep(forTimeInterval: duration)
            print("\(clientOrderNumber)번 고객 \(task)업무 완료")
        }
    }
}
