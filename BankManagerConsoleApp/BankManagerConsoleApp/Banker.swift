//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by 김준건 on 2021/07/30.
//

import Foundation

class Banker {
    func doBusiness(customerQueue: BankManagerQueue<Int>) {
        if let startCurrentCustomer = customerQueue.peek(),
           let finishCurrentCustomer = customerQueue.dequeue() {
            print("\(startCurrentCustomer)" + BankMessage.startWork)
            print("\(finishCurrentCustomer)" + BankMessage.finishWork)
        }
    }
}
