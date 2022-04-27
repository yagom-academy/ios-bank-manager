//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    private(set) var count = 0
    
    var isEmpty: Bool {
        if head == nil {
            return true
        }
        return false
    }
    
    var first: T? {
        return head?.value
    }
    
    mutating func append(value: T) {
        let newNode = Node(value: value)
        if isEmpty {
            head = newNode
            tail = head
            count += 1
            return
        }
        
        newNode.previous = tail
        tail?.next = newNode
        tail = newNode
        count += 1
    }
    
    mutating func removeFirst() -> T? {
        if isEmpty {
            return nil
        }
        
        let dequeueValue = head?.value
        head = head?.next
        count -= 1
        return dequeueValue
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
    
    func index(at inputIndex: Int) -> Node<T>? {
        guard count > inputIndex, inputIndex >= 0 else {
            return nil
        }
        
        var indexCount = 0
        var indexPointer = head
        
        while indexCount < inputIndex {
            indexCount += 1
            indexPointer = indexPointer?.next
        }
        return indexPointer
    }
    
    mutating func insert(value: T, at inputIndex: Int) {
        guard let pointingNode = index(at: inputIndex) else {
            return
        }
        
        let newNode = Node(value: value)
        
        if inputIndex == 0 {
            pointingNode.previous = newNode
            newNode.next = pointingNode
            head = newNode
            count += 1
            return
        }
        
        let previousNode = pointingNode.previous
        newNode.previous = previousNode
        previousNode?.next = newNode
        newNode.next = pointingNode
        pointingNode.previous = newNode
        count += 1
    }
}
