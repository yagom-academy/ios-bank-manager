//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by ehd on 2021/07/28.
//

import Foundation

class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
