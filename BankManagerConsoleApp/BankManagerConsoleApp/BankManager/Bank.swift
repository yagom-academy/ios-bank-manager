//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 예거 on 2021/12/23.
//

import Foundation

class Bank {
    
    weak var delegate: BankMessagePresenter?
    private var clientQueue = Queue<Client>()
    
    func lineUp(_ client: Client) {
        clientQueue.enqueue(client)
    }
    
    func start() {
        var clientCount: Int = .zero
        let startTime = CFAbsoluteTimeGetCurrent()
        let depositSemaphore = DispatchSemaphore(value: 2)
        let loanSemaphore = DispatchSemaphore(value: 1)
        let group = DispatchGroup()
        
        while true {
            guard let client = clientQueue.dequeue() else {
                group.wait()
                workDone(startTime: startTime, clientCount: clientCount)
                return
            }
            clientCount += 1
            
            switch client.task {
            case .deposit:
                DispatchQueue.global().async(group: group) {
                    depositSemaphore.wait()
                    self.service(for: client)
                    depositSemaphore.signal()
                }
            case .loan:
                DispatchQueue.global().async(group: group) {
                    loanSemaphore.wait()
                    self.service(for: client)
                    loanSemaphore.signal()
                }
            }
        }
    }
    
    private func workDone(startTime: CFAbsoluteTime, clientCount: Int) {
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
