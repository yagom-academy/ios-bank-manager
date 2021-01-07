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
    var workingHours: TimeInterval = 0
    private var isWorking: Bool = false
    var isNotWorking: Bool {
        return !isWorking
    }
    
    init(windowNumber: Int) {
        self.windowNumber = windowNumber
        workingQueue = DispatchQueue(label: "\(windowNumber)")
    }
    
    func handleBusiness(for client: Client) {
        let needTimeToWork = client.businessType.neededTime

        isWorking = true
        printStartBusiness(for: client)
        Thread.sleep(forTimeInterval: needTimeToWork)
        workingHours += needTimeToWork
        printFinishBusiness(for: client)
        isWorking = false
    }
    
    private func printStartBusiness(for client: Client) {
        let message = String(format: BankConstant.tellerStartMassage, windowNumber, client.waitingNumber, client.priority.description, client.priority.description)
        print(message)
    }
    
    private func printFinishBusiness(for client: Client) {
        let message = String(format: BankConstant.tellerFinishMessage, windowNumber, client.waitingNumber, client.priority.description, client.priority.description)
        print(message)
    }
}
