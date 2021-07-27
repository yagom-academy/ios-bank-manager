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

class LinkedList <T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func peek() -> T? {
        guard let head = head else {
            return nil
        }
        return head.value
    }

    func clear() {
        head = nil
    }
}
