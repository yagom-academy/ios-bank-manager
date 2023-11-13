//
//  File.swift
//  
//
//  Created by uemu, hisop on 2023/11/13.
//

final class Node<T> {
    let value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var elementCount = 0
    
    var isEmpty: Bool { return head == nil }
    
    var count: Int { return elementCount }
    
    var peek: T? { return head?.value }
    
    mutating func addNode(value: T) {
        let node = Node(value: value)
        elementCount += 1
        
        guard isEmpty == false else {
            head = node
            tail = node
            return
        }
        
        tail?.next = node
        tail = tail?.next
    }
    
    @discardableResult
    mutating func removeNode() -> T? {
        guard let node = head else {
            return nil
        }
        
        head = node.next
        if head == nil {
            tail = nil
        }
        elementCount -= 1
        
        return node.value
    }
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
