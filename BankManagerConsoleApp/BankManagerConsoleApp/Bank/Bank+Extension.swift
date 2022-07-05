//
//  Bank+Extension.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/07/05.
//

import Foundation

extension Bank {
    mutating func openBank() {
        reset()
        let businessReport = runBusiness()
        terminateBusiness(businessReport)
    }

    private mutating func reset() {
        clientQueue = makeClientQueue()
    }
    
    private mutating func makeClientQueue() -> ClientQueue<Client>? {
        var clientQueue = ClientQueue<Client>()
        let task = [Option.deposit, Option.loan]
        
        for waitingNumber in 1...waitingClient {
            guard let taskRandomElement = task.randomElement() else {
                return nil
            }
            let client = Client(waitingNumber: waitingNumber, desiredServices: taskRandomElement)
            clientQueue.enqueue(client)
        }
        return clientQueue
    }
    
    private func runBusiness() -> (Int, CFAbsoluteTime) {
        var servedClient: Int = 0
        let runTime = calculateTotalTime {
            guard let numberOfServedClient = serveClient() else {
                return
            }
            servedClient = numberOfServedClient
        }
        return (servedClient, runTime)
    }
    
    private func calculateTotalTime(of bankTask: () -> Void) -> CFAbsoluteTime {
        let startTime = CFAbsoluteTimeGetCurrent()
        bankTask()
        let totalTime = CFAbsoluteTimeGetCurrent() - startTime

        return totalTime
    }
    
    private func serveClient() -> Int? {
        guard var queue = clientQueue else {
            return nil
        }
        var numberOfServedClient = 0
        let depositBanker = DepositBankManager()
        let loanBanker = LoanBankManager()

        let bankGroup = DispatchGroup()
        let depositQueue = DispatchQueue(label: Option.deposit, attributes: .concurrent)
        let loanQueue = DispatchQueue(label: Option.loan, attributes: .concurrent)
        let memberOfDepositBanker = DispatchSemaphore(value: numberOfDepositBanker)
        let memberOfLoanBanker = DispatchSemaphore(value: numberOfLoanBanker)
        
        while queue.isEmpty == false {
            guard let client = queue.dequeue() else {
                return nil
            }
            if client.desiredServices == Option.deposit {
                depositQueue.async(group: bankGroup) {
                    handleTask(of: depositBanker, by: memberOfDepositBanker, for: client)
                }
            } else if client.desiredServices == Option.loan {
                loanQueue.async(group: bankGroup) {
                    handleTask(of: loanBanker, by: memberOfLoanBanker, for: client)
                }
            }
            numberOfServedClient += 1
        }
        bankGroup.wait()
        
        return numberOfServedClient
    }
    
    private func handleTask(of banker: Banker, by member: DispatchSemaphore, for client: Client) {
        member.wait()
        banker.work(from: client)
        member.signal()
    }

    private mutating func terminateBusiness(_ businessReport: (Int, CFAbsoluteTime)) {
        print("""
        업무가 마감되었습니다. \
        오늘 업무를 처리한 고객은 총 \(businessReport.0)명이며, \
        총 업무시간은 \(String(format: "%.2f", businessReport.1))초입니다.
        """)
    }
}
