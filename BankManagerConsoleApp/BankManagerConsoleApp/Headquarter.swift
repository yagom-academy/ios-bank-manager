//
//  Headquarter.swift
//  BankManagerConsoleApp
//
//  Created by 김태형 on 2021/01/14.
//

import Foundation

enum JudgementState {
    case start
    case end
    
    var description: String {
        switch self {
        case .start:
            return " 대출심사 시작"
        case .end:
            return " 대출심사 완료"
        }
    }
}

class Headquarter {
    let judgementTime: useconds_t = 500000
    let queue: DispatchQueue = DispatchQueue(label: "headquarter")
    static let common = Headquarter()
    let group = DispatchGroup()
    
    private init() {}
    
    func judgeLoan(customer: Customer) {
        queue.async(group: group) {
            self.printJudgementState(state: .start, customer: customer.waitingNumber, customerClass: customer.grade.description)
            usleep(self.judgementTime)
            self.printJudgementState(state: .end, customer: customer.waitingNumber, customerClass: customer.grade.description)
        }
        group.wait()
    }
    
    func printJudgementState(state: JudgementState, customer: Int, customerClass: String) {
        switch state {
        case .start:
            print("\(customer)번 " + customerClass + state.description)
        case .end:
            print("\(customer)번 " + customerClass + state.description)
        }
    }
}
