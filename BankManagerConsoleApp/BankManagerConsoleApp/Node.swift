//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by hoon, minsup on 2023/07/10.
//

final class Node<Value> {
    let value: Value
    var next: Node?

    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
