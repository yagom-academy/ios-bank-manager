//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 재재, 나별 on 2022/06/28.
//

class Node<T> {
    let value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}
