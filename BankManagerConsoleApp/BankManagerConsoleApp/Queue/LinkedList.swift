//  BankManagerConsoleApp - LinkedList.swift
//  Created by Ayaan/Dragon/som on 2022/11/01.
//  Copyright © yagom academy. All rights reserved.

struct LinkedList<T: Equatable> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var count: Int = 0
    var isEmpty: Bool {
        return head == nil
    }
    var first: T? {
        return head?.data
    }
    var last: T? {
        return tail?.data
    }
    
    mutating func append(_ element: T) {
        let newNode: Node<T> = Node(data: element)
        
        if isEmpty == true {
            head = newNode
        } else {
            newNode.previousNode = tail
            tail?.nextNode = newNode
        }
        
        tail = newNode
        count += 1
    }
    
    mutating func removeFirst() -> T? {
        guard let currentHead: Node<T> = head else {
            return nil
        }
        
        head = head?.nextNode
        count -= 1
        
        return currentHead.data
    }
    
    mutating func removeLast() -> T? {
        guard let currentTail: Node<T> = tail else {
            return nil
        }
        
        tail = tail?.previousNode
        tail?.nextNode = nil
        count -= 1
        
        return currentTail.data
    }
    
    func searchFirstNode(from data: T) -> Node<T>? {
        var currentNode: Node<T>? = head
        
        while currentNode != nil {
            if currentNode?.data == data {
                return currentNode
            }
            
            currentNode = currentNode?.nextNode
        }
        
        return nil
    }
    
    func searchNode(at index: Int) -> Node<T>? {
        guard count >= index else {
            return nil
        }
        
        var currentNode: Node<T>? = head
        
        for _ in 1..<index {
            currentNode = currentNode?.nextNode
        }
        
        return currentNode
    }
    
    mutating func remove(at index: Int) -> T? {
        guard let node: Node<T> = searchNode(at: index) else {
            return nil
        }
        
        let previousNode: Node<T>? = node.previousNode
        let nextNode: Node<T>? = node.nextNode
        
        previousNode?.nextNode = nextNode
        nextNode?.previousNode = previousNode
        count -= 1
        
        return node.data
    }
    
    mutating func insert(at index: Int, data: T) {
        guard count >= index else {
            return
        }
        
        var currentNode: Node<T>? = head
        
        for _ in 1..<index {
            currentNode = currentNode?.nextNode
        }
        
        let node: Node<T> = Node(data: data)
        let previousNode: Node<T>? = currentNode?.previousNode
        
        node.previousNode = previousNode
        previousNode?.nextNode = node
        node.nextNode = currentNode
        currentNode?.previousNode = node
        
        count += 1
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
}
