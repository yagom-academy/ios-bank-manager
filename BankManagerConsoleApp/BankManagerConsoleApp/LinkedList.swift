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
    
    init(with data: T) {
        self.data = data
    }
}

class LinkedList<T> {
    var head: Node<T>
    var tail: Node<T>
    
    var isEmpty: Bool {
        return head === tail
    }
    
    init(data: T) {
        let dummyNode = Node(with: data)
        head = dummyNode
        tail = dummyNode
    }
    
    func push(data: T) {
        let newNode = Node(with: data)
        newNode.next = head.next
        head.next = newNode
    }
    
    func append(data: T) {
        let newNode = Node(with: data)
        tail.next = newNode
        tail = newNode
    }
    
    func contains(_ targetNode: Node<T>) -> Bool {
        var currentNode = head
        while let nextNode = currentNode.next, nextNode !== targetNode {
            currentNode = nextNode
        }
        return currentNode !== tail
    }
    
    func insert(data: T, after targetNode: Node<T>) {
        guard self.contains(targetNode) else {
            return
        }
        let newNode = Node(with: data)
        newNode.next = targetNode.next
        targetNode.next = newNode
        if targetNode === tail {
            tail = newNode
        }
    }
    
    //TODO: pop, removeLast, removeAfter,
    func pop() -> Node<T>? {
        if self.isEmpty {
            return nil
        }
        let poppedNode = head.next
        head.next = poppedNode?.next
        if poppedNode === tail {
            tail = head
        }
        return poppedNode
    }
}
