//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/25.
//

class Node<T> {
    var data: T
    var previous: Node?
    var next: Node?

    init(data: T) {
        self.data = data
    }

    init(data: T, previous: Node, next: Node) {
        self.data = data
        self.previous = previous
        self.next = next
    }
}
