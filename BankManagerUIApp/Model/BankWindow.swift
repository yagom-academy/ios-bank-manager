//
//  BankWindow.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

import Foundation

protocol BankWindow: AnyObject {
    func receive(start: () -> (), end: () -> ())
}

final class BankLoanWindow: BankWindow {
    private let workType: Banking = .loan

    func receive(start: () -> (), end: () -> ()) {
        start()
        work()
        end()
    }

    private func work() {
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: workType.processTime)
        }
    }
}

final class BankDepositWindow: BankWindow {
    private let workType: Banking = .deposit

    func receive(start: () -> (), end: () -> ()) {
        start()
        work()
        end()
    }

    private func work() {
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: workType.processTime)
        }
    }
}
