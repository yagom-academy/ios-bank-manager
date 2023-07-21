//
//  Enterable.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/22.
//

protocol Enterable {
    func enterUserInput() -> String?
}

extension Enterable {
    func enterUserInput() -> String? {
        return readLine()
    }
}
