//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by unchain, baekgom on 2022/06/27.
//

import Foundation

class Node<T> {
    var data: T?
    var next: Node?
    
    init (data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
