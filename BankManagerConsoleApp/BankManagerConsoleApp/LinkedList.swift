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
    
    func push(data: T) {
        let newNode = Node(data: data)
        newNode.next = head.next
        head.next = newNode
    }
    
    func append(data: T) {
        let newNode = Node(data: data)
        tail.next = newNode
        tail = newNode
    }
    
    func insert(data: T, after targetNode: Node<T>) {
        var currentNode = head
        while let nextNode = currentNode.next, nextNode !== targetNode {
            currentNode = nextNode
        }
        if currentNode === tail {
            return
        }
        let newNode = Node(data: data)
        newNode.next = targetNode.next
        targetNode.next = newNode
        if targetNode === tail {
            tail = newNode
        }
    }
}
