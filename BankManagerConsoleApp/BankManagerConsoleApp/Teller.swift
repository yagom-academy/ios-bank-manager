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
    
    func printStartBusiness(number: Int) {
        let message = "\(windowNumber)" + Bank.tellerMessageMiddle + "\(number)" + Bank.tellerMessageStart
        print(message)
    }
    
    func printFinishBusiness(number: Int) {
        let message = "\(windowNumber)" + Bank.tellerMessageMiddle + "\(number)" + Bank.tellerMessageEnd
        print(message)
    }
}
