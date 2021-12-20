//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by yeha on 2021/12/20.
//

import Foundation

struct LinkedList {
}

class Node<Type> {
    var data: Type
    var next: Node<Type>?
    
    init(data: Type, next: Node<Type>? = nil) {
        self.data = data
        self.next = next
    }
}
