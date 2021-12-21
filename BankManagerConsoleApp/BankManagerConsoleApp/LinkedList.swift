//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by yeha on 2021/12/20.
//

import Foundation

struct LinkedList<Type> {
    var head: Node<Type>?
    var tail: Node<Type>?
    
    var isEmpty: Bool {
        head == nil
    }
}

class Node<Type> {
    var data: Type
    var next: Node<Type>?
    
    init(data: Type, next: Node<Type>? = nil) {
        self.data = data
        self.next = next
    }
}
