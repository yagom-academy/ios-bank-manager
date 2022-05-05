//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/28.
//

import Foundation

final class Banker {
    func work(customer: Customer?) {
        guard let numberTicekt = customer?.numberTicekt else {
            return
        }
        
        guard let time = customer?.task?.time else {
            return
        }
        
        let businessGroup = DispatchGroup()
        businessGroup.enter()
        DispatchQueue.global().async {
            NotificationCenter.default.post(name: .customerAlram, object: nil, userInfo: ["customerNumberTicekt": numberTicekt])
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + time) {
            NotificationCenter.default.post(name: .removeCustomerAlram, object: nil, userInfo: ["customerNumberTicekt": numberTicekt])
            businessGroup.leave()
        }
        businessGroup.wait()
    }
}
