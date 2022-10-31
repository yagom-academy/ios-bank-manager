//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Tottale, Aaron on 2022/10/31.
//

class Node<T> {
    let value: T
    var next: Node?
    
    init(_ value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
