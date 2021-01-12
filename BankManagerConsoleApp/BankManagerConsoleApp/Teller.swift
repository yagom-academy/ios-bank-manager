//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by 임리나 on 2021/01/05.
//

import Foundation

final class Teller {
    private var windowNumber: Int
    var workingQueue: DispatchQueue
    private var isWorking: Bool = false
    var isNotWorking: Bool {
        return !isWorking
    }
    
    init(windowNumber: Int) {
        self.windowNumber = windowNumber
        workingQueue = DispatchQueue(label: "\(windowNumber)")
    }
    
    func handleBusiness(for client: Client, withDispatchGroup group: DispatchGroup) {
        isWorking = true

        workingQueue.async(group: group) {
            Dashboard.printStatus(for: client, about: Message.tellerStart)
            Thread.sleep(forTimeInterval: client.businessType.neededTime)
            Dashboard.printStatus(for: client, about: Message.tellerFinish)
            self.isWorking = false
        }
    }
}
