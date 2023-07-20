//
//  Managable.swift
//  BankManagerConsoleApp
//
//  Created by mint, Jusbug on 2023/07/13.
//

import Foundation

protocol Manageable {
    var name: String { get }
    var group: DispatchGroup { get }
    
    func open()
}

extension Manageable {
    func sortNext(to: @escaping () -> Void) {
        group.notify(queue: .global()) {
            to()
        }
    }
}
