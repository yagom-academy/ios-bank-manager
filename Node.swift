//
//  Node.swift
//  BankManagerUIApp
//
//  Created by kaki, songjun on 2023/03/06.
//

final class Node<T> {
    let data: T
    var next: Node<T>?
    
    init(_ data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
