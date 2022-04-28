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
        print("\(String(describing: customer?.numberTicekt))번 고객 업무 시작")
        sleep(1)
        print("\(String(describing: customer?.numberTicekt))번 고객 업무 종료")
        customer = nil
    }
}
