//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by 임리나 on 2021/01/05.
//

import Foundation

final class Teller: OperationQueue {
    private var windowNumber: Int
    private var isWorking: Bool = false
    var isNotWorking: Bool {
        return !isWorking
    }
    
    init(windowNumber: Int) {
        self.windowNumber = windowNumber
    }
    
    func handleBusiness(for clientNumber: Int) {
        let client = BankManager.shared.clients[clientNumber]
        let needTimeToWork: UInt32 = UInt32(Bank.milliseconds * client.businessType.neededTime)

        isWorking = true
        printStartBusiness(for: client)
        usleep(needTimeToWork)
        printFinishBusiness(for: client)
        isWorking = false
    }
    
    private func printStartBusiness(for client: Client) {
        let message = String(format: Bank.tellerStartMassage, windowNumber, client.waitingNumber)
        print(message)
    }
    
    private func printFinishBusiness(for client: Client) {
        let message = String(format: Bank.tellerFinishMessage, windowNumber, client.waitingNumber)
        print(message)
    }
}
