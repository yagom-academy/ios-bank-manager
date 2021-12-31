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
    private var bankers: [DispatchQueue]?
    weak var delegate: BankStateDisplayer?
    
    init(numberOfDepositBankers: Int, numberOfLoanBankers: Int) {
        self.numberOfDepositBankers = numberOfDepositBankers
        self.numberOfLoanBankers = numberOfLoanBankers
        self.bankers = configureBankers()
    }
    
    private func configureBankers() -> [DispatchQueue] {
        var bankers = [DispatchQueue]()
        (1...numberOfDepositBankers + numberOfLoanBankers).forEach { number in
            bankers.append(DispatchQueue(label: "\(number)"))
        }
        return bankers
    }
    
    func lineUp(_ client: Client) {
        switch client.task {
        case .deposit:
            depositQueue.enqueue(client)
            delegate?.bank(didReceiveDepositClientOf: client.waitingNumber)
        case .loan:
            loanQueue.enqueue(client)
            delegate?.bank(didReceiveLoanClientOf: client.waitingNumber)
        }
    }
    
    func start() {
        let startTime = CFAbsoluteTimeGetCurrent()
        for number in 1...numberOfDepositBankers {
            serviceForClients(queue: depositQueue, bankerNumber: number)
        }
        for number in numberOfDepositBankers + 1...numberOfDepositBankers + numberOfLoanBankers {
            serviceForClients(queue: loanQueue, bankerNumber: number)
        }
    }
    
    private func serviceForClients(queue: Queue<Client>, bankerNumber: Int) {
        guard let banker = bankers?[bankerNumber - 1] else { return }
        
        banker.async {
            while let client = queue.dequeue() {
                self.service(for: client)
            }
        }
    }
    
    private func service(for client: Client) {
        delegate?.bank(willBeginServiceFor: client.waitingNumber, task: client.task.rawValue)
        client.task.work()
        delegate?.bank(didEndServiceFor: client.waitingNumber, task: client.task.rawValue)
    }
}
