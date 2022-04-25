//
//  DoubleLinkedList.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

struct DoubleLinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var count = 0
    
    var isEmpty: Bool {
        if head == nil {
            return true
        }
        return false
    }
    
    var peek: T? {
        return head?.value
    }
}
