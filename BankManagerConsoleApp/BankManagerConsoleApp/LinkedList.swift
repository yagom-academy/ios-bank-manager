//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by tae hoon park on 2021/07/27.
//

import Foundation

class Node <T> {
    var previous: Node<T>?
    weak var next: Node<T>?
    var value: T
    
    init(value: T) {
        self.value = value
    }
}
