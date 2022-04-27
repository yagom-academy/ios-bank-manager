//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 조민호 on 2022/04/27.
//

import Foundation

final class BankClerk {
    private let name: String
    private let workSpeed: Double
    private weak var delegate: BankDelegate?
    
    init(name: String, workSpeed: Double) {
        self.name = name
        self.workSpeed = workSpeed
    }
    
    func setDelegate(delegate: BankDelegate) {
        self.delegate = delegate
    }
    
    func work(_ queue: Queue<Client>) {
        let workQueue = DispatchQueue(label: name)
        let startTime = CFAbsoluteTimeGetCurrent()
        let workItem = DispatchWorkItem {
            guard let client = queue.peek else {
                return
            }
            print("\(client.waitingNumber)번 고객 업무 시작")
            usleep(UInt32(self.workSpeed))
            print("\(client.waitingNumber)번 고객 업무 완료")
            
            queue.dequeue()
        }
                
        while queue.isEmpty == false {
            workQueue.async(execute: workItem)
        }
        let finishTime = CFAbsoluteTimeGetCurrent()
        let totalTime = finishTime - startTime
        delegate?.close(totalWorkTime: String(format: "%.2f", totalTime))
    }
}
