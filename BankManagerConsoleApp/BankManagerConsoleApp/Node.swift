//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Charlotte, Soll on 2021/07/28.
//

import Foundation

class Node<T> {
    var value: T?
    var next: Node?
    
    init(value: T?, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
