//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/25.
//

final class Node<T> {
    private var data: T
    private var previous: Node?
    private var next: Node?

    init(data: T) {
        self.data = data
    }

    init(data: T, previous: Node, next: Node) {
        self.data = data
        self.previous = previous
        self.next = next
    }
}
