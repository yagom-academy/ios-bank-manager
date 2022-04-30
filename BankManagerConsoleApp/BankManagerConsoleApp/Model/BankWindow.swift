//
//  BankWindow.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

import Foundation

protocol BankWindow {
    var workType: Banking { get }
    func receive(_ customer: Customer)
}

protocol BankWindowDelegate: AnyObject {
    func customerWorkDidStart(customer: Customer)
    func customerWorkDidFinish(customer: Customer)
}

struct BankLoanWindow: BankWindow {
    weak var delegate: BankWindowDelegate?
    let workType: Banking = .loan

    func receive(_ customer: Customer) {
        delegate?.customerWorkDidStart(customer: customer)
        work()
        delegate?.customerWorkDidFinish(customer: customer)
    }

    private func work() {
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: workType.processTime)
        }
    }
}

struct BankDepositWindow: BankWindow {
    weak var delegate: BankWindowDelegate?
    let workType: Banking = .deposit

    func receive(_ customer: Customer) {
        delegate?.customerWorkDidStart(customer: customer)
        work()
        delegate?.customerWorkDidFinish(customer: customer)
    }

    private func work() {
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: workType.processTime)
        }
    }
}
