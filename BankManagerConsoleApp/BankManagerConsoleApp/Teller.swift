//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by 임리나 on 2021/01/05.
//

import Foundation

final class Teller: OperationQueue {
    private var windowNumber: Int
    private var needTimeToWork: Double
    private var isWorking: Bool = false
    var isNotWorking: Bool {
        return !isWorking
    }
    
    init(windowNumber: Int, needTimeToWork: Double) {
        self.windowNumber = windowNumber
        self.needTimeToWork = needTimeToWork
    }
    
    func handleBusiness(for client: Int) {
        let timeToWork: UInt32 = UInt32(Bank.milliseconds * needTimeToWork)

        isWorking = true
        printStartBusiness(for: client)
        usleep(timeToWork)
        printFinishBusiness(for: client)
        isWorking = false
    }
    
    private func printStartBusiness(for number: Int) {
        let message = "\(windowNumber)" + Bank.tellerMessageMiddle + "\(number)" + Bank.tellerMessageStart
        print(message)
    }
    
    private func printFinishBusiness(for number: Int) {
        let message = "\(windowNumber)" + Bank.tellerMessageMiddle + "\(number)" + Bank.tellerMessageEnd
        print(message)
    }
}
