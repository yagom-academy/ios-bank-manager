//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/06/28.
//

final class Node<T> {
    var data: T?
    var next: Node<T>?
    var prev: Node<T>?
    
    init(data: T?, next: Node<T>? = nil, prev: Node<T>? = nil) {
        self.data = data
        self.next = next
        self.prev = prev
    }
}
