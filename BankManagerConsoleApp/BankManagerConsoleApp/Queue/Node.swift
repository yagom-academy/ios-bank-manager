//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by mint, Jusbug on 2023/07/13.
//

final class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
