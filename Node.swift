//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by kaki, songjun on 2023/03/06.
//

final class Node<T> {
    var data: T
    var next: Node<T>?
    
    init(_ data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
