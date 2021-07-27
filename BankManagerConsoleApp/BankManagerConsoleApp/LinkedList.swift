//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Luyan, Marco on 2021/07/27.
//

import Foundation

struct LinkedList<T> {
    private var head: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func clear() {
        head = nil
    }
}
