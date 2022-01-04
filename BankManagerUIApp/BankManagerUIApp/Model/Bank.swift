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
    private var totalNumberOfBankers: Int {
        return numberOfDepositBankers + numberOfLoanBankers
    }
    private var clientQueue = Queue<Client>()
    private var depositQueue = Queue<Client>()
    private var loanQueue = Queue<Client>()
    private var bankers: [DispatchQueue]?
    private var currentTotalClients: Int = .zero {
        didSet {
            if oldValue == .zero && currentTotalClients != .zero {
                timer.activate()
            } else if oldValue != .zero && currentTotalClients == .zero {
                timer.pause()
            }
        }
    }
    var timer = BankTimer()
    weak var delegate: BankStateDisplayer?
    
    init(numberOfDepositBankers: Int, numberOfLoanBankers: Int) {
        guard numberOfDepositBankers >= 1, numberOfLoanBankers >= 1 else {
            fatalError("각 업무를 담당하는 은행원은 최소 1명 이상 필요합니다.")
        }
        self.numberOfDepositBankers = numberOfDepositBankers
        self.numberOfLoanBankers = numberOfLoanBankers
        self.bankers = configureBankers()
    }
    
    private func configureBankers() -> [DispatchQueue] {
        return (1...totalNumberOfBankers).map { DispatchQueue(label: "\($0)") }
    }
    
    func lineUp(_ client: Client) {
        client.task == .deposit ? depositQueue.enqueue(client) : loanQueue.enqueue(client)
        delegate?.bank(didReceiveClientOfNumber: client.waitingNumber, task: client.task)
        currentTotalClients += 1
    }
    
    func start() {
        for number in 1...numberOfDepositBankers {
            serviceForClients(queue: depositQueue, bankerNumber: number)
        }
        for number in (numberOfDepositBankers + 1)...totalNumberOfBankers {
            serviceForClients(queue: loanQueue, bankerNumber: number)
        }
    }
    
    private func serviceForClients(queue: Queue<Client>, bankerNumber: Int) {
        guard bankers?.count ?? .zero >= bankerNumber,
              let banker = bankers?[bankerNumber - 1] else { return }
        
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
        currentTotalClients -= 1
    }
    
    func reset() {
        timer.reset()
        delegate = nil
    }
}
