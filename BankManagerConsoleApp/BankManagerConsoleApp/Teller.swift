//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by 임리나 on 2021/01/05.
//

import Foundation

class Teller: OperationQueue {
    var windowNumber: Int
    var isWorking: Bool = false
    var isNotWorking: Bool {
        return !isWorking
    }
    
    init(windowNumber: Int) {
        self.windowNumber = windowNumber
    }
    
    func handleBusiness(for client: Client) {
        let timeToWork: UInt32 = UInt32(Bank.milliseconds * client.needTimeToWork)

        isWorking = true
        printStartBusiness(number: client.waitingNumber)
        usleep(timeToWork)
        printFinishBusiness(number: client.waitingNumber)
        isWorking = false
    }
    
    func printStartBusiness(number: Int) {
        let message = "\(windowNumber)" + Bank.tellerMessageMiddle + "\(number)" + Bank.tellerMessageStart
        print(message)
    }
    
    func printFinishBusiness(number: Int) {
        let message = "\(windowNumber)" + Bank.tellerMessageMiddle + "\(number)" + Bank.tellerMessageEnd
        print(message)
    }
}
