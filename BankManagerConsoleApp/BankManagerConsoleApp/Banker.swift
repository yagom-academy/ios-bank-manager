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

final class Banker {
    func work(customer: Customer?) {
        guard let customerNumberTicekt = customer?.numberTicekt else {
            return
        }
        let businessGroup = DispatchGroup()
        businessGroup.enter()
        DispatchQueue.global().async {
            print("\(customerNumberTicekt)" + Const.startWorking)
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.7) {
            print("\(customerNumberTicekt)" + Const.endWorking)
            businessGroup.leave()
        }
        businessGroup.wait()
    }
}
