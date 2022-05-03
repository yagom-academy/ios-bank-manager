//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

struct Bank {
    private let loanClerk: Workable
    private let depositClerk: Workable
    private var clientQueue = Queue(list: LinkedList<Client>())
    private var semaphore: DispatchSemaphore
    private let clerks = DispatchGroup()
    
    init(loanClerkCount: Int, depositClerkCount: Int) {
        self.loanClerk = BankClerk(workType: .loan, clerkCount: loanClerkCount)
        self.depositClerk = BankClerk(workType: .deposit, clerkCount: depositClerkCount)
        self.semaphore = DispatchSemaphore(value: loanClerkCount + depositClerkCount)
    }
    
    mutating func executeBankWork() {
        let start = CFAbsoluteTimeGetCurrent()
        let numberOfClients = receiveClients()
        
        serveClients()
        
        let interval = CFAbsoluteTimeGetCurrent() - start
        let resultDescription = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f입니다."
        let resultMessage = String(format: resultDescription, numberOfClients, interval)
        
        print(resultMessage)
    }
    
    @discardableResult
    private mutating func receiveClients() -> Int {
        for order in 1...Int.random(in: 10...30) {
            clientQueue.enqueue(Client(order))
        }
        return clientQueue.count
    }
    
    private mutating func serveClients() {
        while let client = clientQueue.dequeue() {
            self.semaphore.wait()
            
            DispatchQueue.global().async(group: clerks) { [self] in
                client.wantedWork == .loan ? self.loanClerk.deal(with: client) : self.depositClerk.deal(with: client)
                self.semaphore.signal()
            }
        }
        clerks.wait()
    }
}
