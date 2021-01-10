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
    
    func handleBusiness(for client: Client) {
        isWorking = true
        switch client.businessType {
        case .deposit:
            handleDeposit(for: client)
        case .loan:
            handleLoan(for: client)
        }
        isWorking = false
    }
    
    func handleDeposit(for client: Client) {
        Dashboard.printStatus(for: client, about: Message.tellerStart)
        Thread.sleep(forTimeInterval: client.businessType.neededTime)
        Dashboard.printStatus(for: client, about: Message.tellerFinish)
    }
    
    
    func handleLoan(for client: Client) {
        let semaphore = DispatchSemaphore(value: 0)
        
        Dashboard.printStatus(for: client, about: Message.tellerStart)
        Thread.sleep(forTimeInterval: client.businessType.neededTime)
        HeadOffice.shared.loanQueue.async {
            HeadOffice.shared.judgeLoan(for: client)
            semaphore.signal()
        }
        semaphore.wait()
        Thread.sleep(forTimeInterval: client.businessType.neededTime)
        Dashboard.printStatus(for: client, about: Message.tellerFinish)
    }
}
