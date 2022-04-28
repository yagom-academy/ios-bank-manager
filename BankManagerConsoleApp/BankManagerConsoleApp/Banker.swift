//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/28.
//

import Foundation

class Banker {
    var customer: Customer?
    
    func work() {
        guard let customerNumberTicekt = customer?.numberTicekt else {
            return
        }
        
        print("\(customerNumberTicekt)번 고객 업무 시작")
        usleep(700000)
        print("\(customerNumberTicekt)번 고객 업무 종료")
        customer = nil
    }
}
