//  Node.swift
//  BankManagerConsoleApp
//  Created by Baem & Bella on 2022/11/01.

class Node<T> {
    let value: T?
    var next: Node?
    
    init(value: T?, next: Node?) {
        self.value = value
        self.next = next
    }
}
