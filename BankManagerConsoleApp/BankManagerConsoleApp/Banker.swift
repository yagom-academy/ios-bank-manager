//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/28.
//

import Foundation

fileprivate extension Const {
    static let startWorking = "번 고객 업무 시작"
    static let endWorking = "번 고객 업무 종료"
}

class Banker {
    func work(customer: Customer?) {
        guard let customerNumberTicekt = customer?.numberTicekt else {
            return
        }
        
        print("\(customerNumberTicekt)" + Const.startWorking)
        Thread.sleep(forTimeInterval: Const.workTimeForCustomer)
        print("\(customerNumberTicekt)" + Const.endWorking)
    }
}
