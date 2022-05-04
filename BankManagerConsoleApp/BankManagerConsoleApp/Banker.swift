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
        guard let task = customer?.task?.rawValue else {
            return
        }
        
        guard let time = customer?.task?.time else {
            return
        }
        
        let businessGroup = DispatchGroup()
        businessGroup.enter()
        DispatchQueue.global().async {
            print("\(numberTicekt)번 고객 \(task) 시작")
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + time) {
            print("\(numberTicekt)번 고객 \(task) 종료")
            businessGroup.leave()
        }
        businessGroup.wait()
    }
}
