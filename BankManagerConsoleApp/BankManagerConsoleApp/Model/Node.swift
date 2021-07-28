//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Ellen on 2021/07/27.
//

import Foundation

class Node<T> {
    
    var value: T
    var next: Node?
    
    init(value: T, next: Node?) {
        self.value = value
        self.next = next
    }
}
