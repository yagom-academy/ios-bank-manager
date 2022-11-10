//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

import Foundation

protocol BankWorkable { }

extension BankWorkable {
    func startWork(client: Client) {
        switch client.purpose {
        case .deposit:
            Thread.sleep(forTimeInterval: 0.7)
        case .loan:
            Thread.sleep(forTimeInterval: 1.1)
        }
    }
}

struct Banker: BankWorkable { }
