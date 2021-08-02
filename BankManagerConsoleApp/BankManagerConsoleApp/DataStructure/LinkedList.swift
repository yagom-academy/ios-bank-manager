//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 홍정아 on 2021/07/27.
//

import Foundation

class Node<T> {
    var data: T!
    var next: Node<T>?
    
    init(with data: T) {
        self.data = data
    }
    
    fileprivate init() {
        self.data = nil
    }
}

struct LinkedList<T> {
    private var head: Node<T>
    private var tail: Node<T>
    
    var peek: Node<T>? {
        return head.next
    }
    
    var isEmpty: Bool {
        return head === tail
    }
    
    init() {
        let dummyNode = Node<T>()
        head = dummyNode
        tail = dummyNode
    }
    
    func push(data: T) {
        let newNode = Node(with: data)
        newNode.next = head.next
        head.next = newNode
    }
    
    mutating func append(data: T) {
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
    
    mutating func insert(data: T, after targetNode: Node<T>) {
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
    
    mutating func pop() -> Node<T>? {
        if self.isEmpty {
            return nil
        }
        let frontNode = head.next
        head.next = frontNode?.next
        if frontNode === tail {
            tail = head
        }
        return frontNode
    }
    
    mutating func removeLast() -> Node<T>? {
        if self.isEmpty {
            return nil
        }
        var currentNode = head
        while let nextNode = currentNode.next, nextNode !== tail {
            currentNode = nextNode
        }
        let rearNode = tail
        tail = currentNode
        return rearNode
    }
    
    mutating func remove(after targetNode: Node<T>) -> Node<T>? {
        guard self.contains(targetNode) else {
            return nil
        }
        let nodeToRemove = targetNode.next
        targetNode.next = nodeToRemove?.next
        if nodeToRemove === tail {
            tail = targetNode
        }
        return nodeToRemove
    }
    
    mutating func clear() {
        head.next = nil
        tail = head
    }
}
