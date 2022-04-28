//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 조민호 on 2022/04/27.
//

import Foundation

fileprivate extension Constants {
    static let decimalPlace = "%.2f"
}

final class BankClerk: Presentable {
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
            
            self.printStartTaskMessage(waitingNumber: client.waitingNumber)
            Thread.sleep(forTimeInterval: self.workSpeed)
            self.printFinishTaskMessage(waitingNumber: client.waitingNumber)
            
            queue.dequeue()
        }
                
        while queue.isEmpty == false {
            workQueue.sync(execute: workItem)
        }
        
        let finishTime = CFAbsoluteTimeGetCurrent()
        let totalTime = finishTime - startTime
        
        delegate?.close(totalWorkTime: totalTime.formatted)
    }
}

fileprivate extension CFAbsoluteTime {
    var formatted: String {
        String(format: Constants.decimalPlace, self)
    }
}
