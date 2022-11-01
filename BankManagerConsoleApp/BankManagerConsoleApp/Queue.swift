//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/01.
//

import Foundation

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
