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
    
    @discardableResult
    mutating func removeFirst() -> T? {
        guard let currentHead: Node<T> = head else {
            return nil
        }
        
        head = head?.nextNode
        count -= 1
        
        return currentHead.data
    }
    
    @discardableResult
    mutating func removeLast() -> T? {
        guard let currentTail: Node<T> = tail else {
            return nil
        }
        
        tail = tail?.previousNode
        tail?.nextNode = nil
        count -= 1
        
        return currentTail.data
    }
    
    func searchNode(at nodePosition: Int) -> Node<T>? {
        let targetPosition: Int = nodePosition - 1
        guard (targetPosition < count) == true else {
            return nil
        }
        
        var currentNode: Node<T>? = head
        
        for position in 0..<count {
            if position == targetPosition {
                break
            } else {
                currentNode = currentNode?.nextNode
            }
        }
        
        return currentNode
    }
    
    @discardableResult
    mutating func remove(at nodePosition: Int) -> T? {
        if nodePosition == 0 {
            return removeFirst()
        } else if nodePosition == count - 1 {
            return removeLast()
        } else if let node: Node<T> = searchNode(at: nodePosition) {
            node.previousNode?.nextNode = node.nextNode
            node.nextNode?.previousNode = node.previousNode
            
            return node.data
        } else {
            return nil
        }
    }
    
    mutating func insert(at nodePosition: Int, data: T) {
        let node: Node<T> = Node(data: data)

        if nodePosition == count {
            append(data)
        } else if nodePosition == 0 {
            node.nextNode = head
            head?.previousNode = node
            
            head = node
        } else if let currentNodePosition: Node<T> = searchNode(at: nodePosition) {
            let previousNode: Node<T>? = currentNodePosition.previousNode
            
            node.previousNode = previousNode
            node.nextNode = currentNodePosition
            
            previousNode?.nextNode = node
            currentNodePosition.previousNode = node
        }
    }
    
    @discardableResult
    mutating func removeFirst(of data: T) -> T? {
        var currentNode: Node<T>? = head
        var currentPosition: Int = 0
        
        repeat {
            if currentNode?.data == data {
                remove(at: currentPosition)
                return currentNode?.data
            } else {
                currentNode = currentNode?.nextNode
                currentPosition += 1
            }
        } while currentNode != nil
        
        return nil
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
}
