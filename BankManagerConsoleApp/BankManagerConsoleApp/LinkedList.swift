//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 레옹아범, 혜모리 on 2023/03/06.
//

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var isEmpty: Bool { head == nil }
    var peek: T? { head?.orderNumber }
    
    mutating func appendLast(_ data: T) {
        let node = Node(orderNumber: data)
        
        guard isEmpty == false else {
            head = node
            tail = head
            return
        }
        
        tail?.next = node
        tail = node
    }
    
    mutating func removeFirst() -> T? {
        let firstNode = head
        
        guard isEmpty == false else {
            return nil
        }
        
        head = firstNode?.next
        return firstNode?.orderNumber
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
