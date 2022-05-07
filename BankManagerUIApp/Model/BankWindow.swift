//
//  BankWindow.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

import Foundation

protocol BankWindow: AnyObject {
    func receive(start: (() -> Void)?, end: (() -> Void)?)
}

final class BankLoanWindow: BankWindow {
    private let workType: Banking = .loan

    func receive(start: (() -> Void)? = nil, end: (() -> Void)? = nil) {
        start?()
        work()
        end?()
    }

    private func work() {
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: workType.processTime)
        }
    }
}

final class BankDepositWindow: BankWindow {
    private let workType: Banking = .deposit

    func receive(start: (() -> Void)? = nil, end: (() -> Void)? = nil) {
        start?()
        work()
        end?()
    }

    private func work() {
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: workType.processTime)
        }
    }
}
