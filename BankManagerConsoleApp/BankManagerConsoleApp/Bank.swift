//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/06/30.
//

import Foundation

struct Bank {
    private(set) var waitingClient: Int
    private(set) var numberOfDepositBanker: Int
    private(set) var numberOfLoanBanker: Int
    var clientQueue: ClientQueue<Client>?
    
    init(waitingClient: Int, numberOfDepositBanker: Int, numberOfLoanBanker: Int) {
        self.waitingClient = waitingClient
        self.numberOfDepositBanker = numberOfDepositBanker
        self.numberOfLoanBanker = numberOfLoanBanker
    }
}

extension Bank {
    mutating func openBank() {
        reset()
        let doneTask = runBusiness()
        transmit(businessReport: doneTask)
    }

    private mutating func reset() {
        clientQueue = makeClientQueue()
    }
    
    private mutating func makeClientQueue() -> ClientQueue<Client>? {
        var clientQueue = ClientQueue<Client>()
        let task = [Task.deposit, Task.loan]
        
        for waitingNumber in 1...waitingClient {
            guard let taskRandomElement = task.randomElement() else {
                return nil
            }
            let client = Client(waitingNumber: waitingNumber,
                                desiredServices: taskRandomElement)
            clientQueue.enqueue(client)
        }
        return clientQueue
    }
    
    private func runBusiness() -> (Int, CFAbsoluteTime) {
        let result = serveClient()
        
        return result
    }
    
    private func calculateTotalTime(of bankTask: () -> Void) -> CFAbsoluteTime {
        let startTime = CFAbsoluteTimeGetCurrent()
        bankTask()
        let totalTime = CFAbsoluteTimeGetCurrent() - startTime

        return totalTime
    }
    
    private func serveClient() -> (Int, CFAbsoluteTime) {
        var numberOfServedClient: Int = .zero
        let runtime = calculateTotalTime {
            guard var queue = clientQueue else {
                return
            }
            
            let depositBanker = DepositBankManager()
            let loanBanker = LoanBankManager()

            let bankGroup = DispatchGroup()
            let depositQueue = DispatchQueue(label: Task.deposit,
                                             attributes: .concurrent)
            let loanQueue = DispatchQueue(label: Task.loan,
                                          attributes: .concurrent)
            let memberOfDepositBanker = DispatchSemaphore(value: numberOfDepositBanker)
            let memberOfLoanBanker = DispatchSemaphore(value: numberOfLoanBanker)
            
            while queue.isEmpty == false {
                guard let client = queue.dequeue() else {
                    return
                }
                switch client.desiredServices {
                case Task.deposit:
                    work(queue: depositQueue,
                         bankGroup: bankGroup,
                         banker: depositBanker,
                         memberOfDepositBanker: memberOfDepositBanker,
                         client: client)
                case Task.loan:
                    work(queue: loanQueue,
                         bankGroup: bankGroup,
                         banker: loanBanker,
                         memberOfDepositBanker: memberOfLoanBanker,
                         client: client)
                default:
                    break
                }
                numberOfServedClient += 1
            }
            bankGroup.wait()
        }
        return (numberOfServedClient, runtime)
    }
    
    private func work(queue: DispatchQueue, bankGroup: DispatchGroup, banker: Banker, memberOfDepositBanker: DispatchSemaphore, client: Client) {
        queue.async(group: bankGroup) {
            handleTask(of: banker,
                       by: memberOfDepositBanker,
                       for: client)
        }
    }
    
    private func handleTask(of banker: Banker, by member: DispatchSemaphore, for client: Client) {
        member.wait()
        banker.work(from: client)
        member.signal()
    }

    private mutating func transmit(businessReport: (Int, CFAbsoluteTime)) {
        print("""
        업무가 마감되었습니다. \
        오늘 업무를 처리한 고객은 총 \(businessReport.0)명이며, \
        총 업무시간은 \(String(format: "%.2f", businessReport.1))초입니다.
        """)
    }
}
