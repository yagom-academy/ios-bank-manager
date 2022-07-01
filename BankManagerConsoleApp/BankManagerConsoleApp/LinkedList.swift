//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/06/27.
//

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var nodeCount: Int = 0
    lazy var currentNode: Node<T>? = head
    
    mutating func add(node: Node<T>) {
        nodeCount += 1
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            node.previous = tail
            tail = node
        }
    }
    
    mutating func removeFirst() -> Node<T>? {
        nodeCount -= 1
        let returnData = head
        
        head?.next?.previous = nil
        head = head?.next
        
        return returnData
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
}
