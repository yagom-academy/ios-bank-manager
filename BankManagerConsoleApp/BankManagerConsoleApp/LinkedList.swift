//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/06.
//

struct LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(_ data: T) {
        let node = Node(data)
        
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
    }
    
    mutating func removeFirst() -> T? {
        guard let node = head else {
            return nil
        }
        
        head = head?.next
        
        return node.data
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
}
