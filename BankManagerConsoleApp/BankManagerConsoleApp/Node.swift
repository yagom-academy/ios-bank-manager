//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by junho, woong on 2022/11/01.
//

class Node<T> {
    var data: T?
    var next: Node<T>?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
