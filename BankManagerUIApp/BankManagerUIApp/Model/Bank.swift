//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 예거 on 2021/12/23.
//

import Foundation

class Bank {
    
    private var numberOfDepositBankers: Int
    private var numberOfLoanBankers: Int
    private var clientQueue = Queue<Client>()
    private var depositQueue = Queue<Client>()
    private var loanQueue = Queue<Client>()
    weak var delegate: BankMessagePresenter?
    
    init(numberOfDepositBankers: Int, numberOfLoanBankers: Int) {
        self.numberOfDepositBankers = numberOfDepositBankers
        self.numberOfLoanBankers = numberOfLoanBankers
    }
    
    func lineUp(_ client: Client) {
        switch client.task {
        case .deposit:
            depositQueue.enqueue(client)
        case .loan:
            loanQueue.enqueue(client)
        }
    }
    
    func start(with totalClients: Int) {
        let startTime = CFAbsoluteTimeGetCurrent()
        let dispatchGroup = DispatchGroup()
        for _ in 1...numberOfDepositBankers {
            serviceForClients(queue: depositQueue, in: dispatchGroup)
        }
        for _ in 1...numberOfLoanBankers {
            serviceForClients(queue: loanQueue, in: dispatchGroup)
        }
        dispatchGroup.wait()
        notifyWorkDone(startTime: startTime, clientCount: totalClients)
    }
    
    private func serviceForClients(queue: Queue<Client>, in dispatchGroup: DispatchGroup) {
        DispatchQueue.global().async(group: dispatchGroup) {
            while let client = queue.dequeue() {
                self.service(for: client)
            }
        }
    }
    
    private func notifyWorkDone(startTime: CFAbsoluteTime, clientCount: Int) {
        let endTime = CFAbsoluteTimeGetCurrent()
        let workingDuration = endTime - startTime
        delegate?.bankDidClose(totalClient: clientCount,
                               for: workingDuration.roundOff())
    }
    
    private func service(for client: Client) {
        delegate?.bank(willBeginServiceFor: client.waitingNumber, task: client.task.rawValue)
        client.task.work()
        delegate?.bank(didEndServiceFor: client.waitingNumber, task: client.task.rawValue)
    }
}
