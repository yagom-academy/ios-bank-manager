//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by minsson, Derrick kim on 2022/07/01.
//

import Foundation

final class Bank {
    private let depositManager1 = BankManager()
    private let depositManager2 = BankManager()
    
    private let semaphore = DispatchSemaphore(value: 1)
    
    private(set) var clientQueue = ClientQueue<Client>()
    
    private var totalProcessingTime: Double = 0.0
    private var totalVisitedClients: Int = 0
}

extension Bank {
    func open() {
        generateClients()
        
        
        //        while !clientQueue.isEmpty() {
        //            assignTask(to: manager)
        //        }
        
        //        DispatchQueue.global().async {
        //            while !self.clientQueue.isEmpty() {
        //                self.semaphore.wait()
        //                print("매니저1")
        //                self.assignTask(to: self.depositManager1)
        //                self.semaphore.signal()
        //                Thread.sleep(forTimeInterval: 0.7)
        //
        //            }
        //        }
        let myGroup = DispatchGroup()
        
        let startTime = CFAbsoluteTimeGetCurrent()
        
        DispatchQueue.global().sync {
        
            DispatchQueue.global().async(group: myGroup) {
                while !self.clientQueue.isEmpty() {
                    self.semaphore.wait()
                    
                    
                    guard let client = self.clientQueue.dequeue() else {
                        return
                    }
                    
                    self.totalVisitedClients += 1
                    
                    
                    self.depositManager1.processRequest(from: client)
                    print("매니저 1: \(client.waitingNumber)번 고객 업무 시작")
                    
                    self.semaphore.signal()
                    
                    
                    Thread.sleep(forTimeInterval: 0.7)
                    
                    print("매니저 1: \(client.waitingNumber)번 고객 업무 완료")
                    self.totalProcessingTime += client.request.processingTime
                }
            }
            
            DispatchQueue.global().async(group: myGroup) {
                while !self.clientQueue.isEmpty() {
                    self.semaphore.wait()
                    
                    
                    guard let client = self.clientQueue.dequeue() else {
                        return
                    }
                    
                    self.totalVisitedClients += 1
                    
                    self.depositManager2.processRequest(from: client)
                    print("매니저 2: \(client.waitingNumber)번 고객 업무 시작")
                    
                    self.semaphore.signal()
                    
                    
                    Thread.sleep(forTimeInterval: 0.7)
                    
                    print("매니저 2: \(client.waitingNumber)번 고객 업무 완료")
                    self.totalProcessingTime += client.request.processingTime
                }
            }
            
            myGroup.wait()
        }
        let closeTime = CFAbsoluteTimeGetCurrent()
        let elapsedTime = closeTime - startTime
        
        self.reportSummary()
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalVisitedClients)명이며, 총 업무시간은 \(elapsedTime.roundDown())초입니다.")
    }
    
    func close() {
        totalProcessingTime = 0.0
        totalVisitedClients = 0
    }
}

// loan 추가

// 메서드로 기능 분리


private extension Bank {
    func generateClients() {
        let clientAmount = Int.random(in: 10...30)
        let task: Request = .task
        
        for amount in 1...clientAmount {
            clientQueue.enqueue(Client(request: task, waitingNumber: amount))
        }
    }
    
    func assignTask(to bankManager: BankManager) {
        
    }
    
    func reportSummary() {

    }
}
