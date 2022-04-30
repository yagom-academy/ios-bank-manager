//
//  BankWindow.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

import Foundation

protocol BankWindow {
    func work(for customer: Customer)
}

protocol BankWindowDelegate: AnyObject {
    func customerWorkDidStart(customer: Customer)
    func customerWorkDidFinish(customer: Customer)
}

struct BankCommonWindow: BankWindow {
    weak var delegate: BankWindowDelegate?

    func work(for customer: Customer) {
        delegate?.customerWorkDidStart(customer: customer)
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: 0.7)
        }
        delegate?.customerWorkDidFinish(customer: customer)
    }
}
