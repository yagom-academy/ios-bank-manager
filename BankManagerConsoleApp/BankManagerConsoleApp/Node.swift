//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Aaron, Tottale on 10/31/22.
//

final class Node<T> {
    let value: T
    var next: Node?
    
    init(_ value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
