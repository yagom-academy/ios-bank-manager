//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by 김준건 on 2021/07/30.
//

import Foundation

class Banker {
    private let customerQueue:BankManagerQueue<Int>
    
    init(customerQueue: BankManagerQueue<Int>) {
        self.customerQueue = customerQueue
    }
    
    func doBusiness() {
        if let startCurrentCustomer = customerQueue.peek(),
           let finishCurrentCustomer = customerQueue.dequeue() {
            print("\(startCurrentCustomer)" + BankMessage.startWork)
            print("\(finishCurrentCustomer)" + BankMessage.finishWork)
        }
    }
}
