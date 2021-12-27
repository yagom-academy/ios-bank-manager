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
        let semaphore = DispatchSemaphore(value: 3)
        let group = DispatchGroup()
        
        while true {
            guard let client = clientQueue.dequeue() else {
                group.wait()
                let endTime = CFAbsoluteTimeGetCurrent()
                let workingDuration = endTime - startTime
                delegate?.bankDidClose(totalClient: clientCount,
                                       for: workingDuration.roundOff())
                return
            }
            
            DispatchQueue.global().async(group: group) {
                semaphore.wait()
                self.service(for: client)
                clientCount += 1
                semaphore.signal()
            }
        }
    }
    
    private func service(for client: Client) {
        delegate?.bank(willBeginServiceFor: client.waitingNumber, task: client.task.rawValue)
        client.task.work()
        delegate?.bank(didEndServiceFor: client.waitingNumber, task: client.task.rawValue)
    }
}
