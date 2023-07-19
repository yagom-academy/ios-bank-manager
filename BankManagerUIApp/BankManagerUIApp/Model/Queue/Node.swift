//
//  Node.swift
//  BankManagerUIApp
//
//  Created by mint, Jusbug on 2023/07/10.
//

final class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
