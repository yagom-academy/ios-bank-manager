//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by 김준건 on 2021/07/30.
//

import Foundation

class Banker {
    let type: BusinessType
    init(type: BusinessType) {
        self.type = type
    }
    
    func doBusiness(customerQueue: BankManagerQueue<Customer>) {
        let semaphore = DispatchSemaphore(value: 2)
        semaphore.wait()
        if let startCurrentCustomer = customerQueue.peek(),
           let finishCurrentCustomer = customerQueue.dequeue() {
            print("\(startCurrentCustomer.numberTicket)" + BankMessage.startWork)
            DispatchQueue.global().asyncAfter(deadline: .now() + type.workingTime) {
                print("\(finishCurrentCustomer)" + BankMessage.finishWork)
                semaphore.signal()
            }
        }
    }
}
