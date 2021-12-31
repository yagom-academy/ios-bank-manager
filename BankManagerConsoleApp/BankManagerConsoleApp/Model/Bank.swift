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
        var totalHandledClientCount: Int = 0
        let clientCountingSemaphore = DispatchSemaphore(value: 1)
        let loanSemaphore = DispatchSemaphore(value: numberOfClerksForLoans)
        let depositSemaphore = DispatchSemaphore(value: numberOfClerksForDeposits)
        let group = DispatchGroup()
        let loanWindow = BankWindow(taskResponsibility: .loan)
        let depositWindow = BankWindow(taskResponsibility: .deposit)
        
        DispatchQueue.global().async(group: group) {
            while let loanClient = self.loanClientQueue.dequeue() {
                DispatchQueue.global().async(group: group) {
                    loanSemaphore.wait()
                    loanWindow.work(for: loanClient)
                    loanSemaphore.signal()
                    
                    clientCountingSemaphore.wait()
                    totalHandledClientCount += 1
                    clientCountingSemaphore.signal()
                }
            }
        }
        
        DispatchQueue.global().async(group: group) {
            while let depositClient = self.depositClientQueue.dequeue() {
                DispatchQueue.global().async(group: group) {
                    depositSemaphore.wait()
                    depositWindow.work(for: depositClient)
                    depositSemaphore.signal()
                    
                    clientCountingSemaphore.wait()
                    totalHandledClientCount += 1
                    clientCountingSemaphore.signal()
                }
            }
        }
        
        group.wait()
        return totalHandledClientCount
    }
    
    private func showClosingMessage(with totalHandledClientCount: Int, and processTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalHandledClientCount)명이며, 총 업무시간은 \(processTime.secondDecimalFormat)초입니다.")
    }
}

//MARK: - 중첩타입
extension Bank {
    private struct BankWindow {
        let taskResponsibility: Task
        
        func work(for client: Client) {
            let clientOrderNumber = client.orderTicket.number
            let duration = client.taskDuration
            
            print("\(clientOrderNumber)번 고객 \(taskResponsibility)업무 시작")
            Thread.sleep(forTimeInterval: duration)
            print("\(clientOrderNumber)번 고객 \(taskResponsibility)업무 완료")
        }
    }
}
