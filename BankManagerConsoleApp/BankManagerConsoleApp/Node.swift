//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Kiwi, Kay on 2022/06/27.
//

final class Node<T> {
    private(set) var data: T?
    var next: Node<T>?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

extension Node: Equatable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        lhs === rhs
    }
}
