//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 홍정아 on 2021/07/27.
//

import Foundation

class Node<T> {
    var data: T
    var next: Node<T>?
    
    init(data: T) {
        self.data = data
    }
}

class LinkedList<T> {
    var head: Node<T>
    var tail: Node<T>
    
    init(data: T) {
        let dummyNode = Node(data: data)
        head = dummyNode
        tail = dummyNode
    }
    
    func append(data: T) {
        let newNode = Node(data: data)
        tail.next = newNode
        tail = newNode
    }
}
