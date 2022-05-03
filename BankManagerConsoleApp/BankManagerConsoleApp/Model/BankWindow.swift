//
//  BankWindow.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

import Foundation

protocol BankWindow: AnyObject {
    func receive(_ customer: Customer)
    var delegate: BankWindowDelegate? { get set }
}

protocol BankWindowDelegate: AnyObject {
    func customerWorkDidStart(_ bankWindow: BankWindow, customer: Customer)
    func customerWorkDidFinish(_ bankWindow: BankWindow, customer: Customer)
}

class BankLoanWindow: BankWindow {
    weak var delegate: BankWindowDelegate?
    let workType: Banking = .loan

    func receive(_ customer: Customer) {
        delegate?.customerWorkDidStart(self, customer: customer)
        work()
        delegate?.customerWorkDidFinish(self, customer: customer)
    }

    private func work() {
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: workType.processTime)
        }
    }
}

class BankDepositWindow: BankWindow {
    weak var delegate: BankWindowDelegate?
    let workType: Banking = .deposit

    func receive(_ customer: Customer) {
        delegate?.customerWorkDidStart(self, customer: customer)
        work()
        delegate?.customerWorkDidFinish(self, customer: customer)
    }

    private func work() {
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: workType.processTime)
        }
    }
}
