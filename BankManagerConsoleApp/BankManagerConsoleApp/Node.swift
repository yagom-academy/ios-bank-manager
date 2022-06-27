//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by bonf, judy on 2022/06/27.
//

class Node<T> {
    let value: T
    var next: Node?
    
    init(_ value: T) {
        self.value = value
    }
}

extension Node: Equatable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs === rhs
    }
}
