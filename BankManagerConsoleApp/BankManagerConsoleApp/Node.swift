//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

class Node<T> {
    var value: T
    var previous: Node?
    var next: Node?
    
    init(value: T, previous: Node? = nil, next: Node? = nil) {
        self.value = value
        self.previous = previous
        self.next = next
    }
}
