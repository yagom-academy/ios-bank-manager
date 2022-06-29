//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created byfinnn, bard on 2022/06/27.
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
        while nodeCount != 0 {
            head = head?.next
            head?.previous?.next = nil
            head?.previous = nil
            nodeCount -= 1
        }
        
        head = nil
        tail = nil
    }
}
