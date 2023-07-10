//
//  Node.swift
//  BankManagerUIApp
//
//  Created by 박종화 on 2023/07/10.
//

import Foundation

class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
