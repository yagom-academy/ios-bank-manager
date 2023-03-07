//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 레옹아범, 혜모리 on 2023/03/06.
//

struct LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    var isEmpty: Bool { head == nil }
    var peek: T? { head?.value }
    
    mutating func appendLast(_ data: T) {
        let node = Node(value: data)
        
        guard isEmpty == false else {
            head = node
            tail = head
            return
        }
        
        tail?.next = node
        tail = node
    }
    
    mutating func removeFirst() -> T? {
        guard isEmpty == false else {
            return nil
        }
        
        let firstNode = head
        
        head = firstNode?.next
        return firstNode?.value
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
