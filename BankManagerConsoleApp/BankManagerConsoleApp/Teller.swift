//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by 임리나 on 2021/01/05.
//

import Foundation

final class Teller {
    private var windowNumber: Int
    let workingQueue: DispatchQueue
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
            switch client.businessType {
            case .deposit:
                self.handleDeposit(for: client)
            case .loan:
                self.handleLoan(for: client)
            }
            self.isWorking = false
        }
    }
    
    private func handleDeposit(for client: Client) {
        Dashboard.printStatus(for: client, about: Message.tellerStart)
        Thread.sleep(forTimeInterval: client.businessType.neededTime)
        Dashboard.printStatus(for: client, about: Message.tellerFinish)
    }
    
    
    private func handleLoan(for client: Client) {
        reviewDocument(for: client)
        sendDocumentToHeadOffice(for: client)
        finishLoan(for: client)
    }
    
    private func reviewDocument(for client: Client) {
        Dashboard.printStatus(for: client, about: Message.tellerStart)
        Thread.sleep(forTimeInterval: client.businessType.neededTime)
    }
    
    private func sendDocumentToHeadOffice(for client: Client) {
        let semaphore = DispatchSemaphore(value: 0)
        
        HeadOffice.shared.loanQueue.async {
            HeadOffice.shared.judgeLoan(for: client)
            semaphore.signal()
        }
        semaphore.wait()
    }
    
    private func finishLoan(for client: Client) {
        Thread.sleep(forTimeInterval: client.businessType.neededTime)
        Dashboard.printStatus(for: client, about: Message.tellerFinish)
    }
}
