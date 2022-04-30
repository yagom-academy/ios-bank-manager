//
//  BankWindow.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

import Foundation

protocol BankWindow {
    func receive(_ customer: Customer)
}

protocol BankWindowDelegate: AnyObject {
    func customerWorkDidStart(customer: Customer)
    func customerWorkDidFinish(customer: Customer)
}

struct BankCommonWindow: BankWindow {
    weak var delegate: BankWindowDelegate?

    func receive(_ customer: Customer) {
        delegate?.customerWorkDidStart(customer: customer)
        work()
        delegate?.customerWorkDidFinish(customer: customer)
    }

    private func work() {
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: 0.7)
        }
    }
}
