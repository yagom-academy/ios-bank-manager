//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Kiwi, Kay on 2022/06/27.
//

struct Linkedlist<T> {
    private(set) var head: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var peek: T? {
        return head?.data
    }
    
    mutating func append(data: T) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
    
    mutating func removeFirst() -> T? {
        if head == nil {
            return nil
        }
        
        let firstElement = head?.data
        head = head?.next
        return firstElement
    }
    
    mutating func removeAll() {
        head = nil
    }
}
