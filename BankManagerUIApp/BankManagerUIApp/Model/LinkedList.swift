//
//  LinkedList.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/06.
//

struct LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    private var isEmpty: Bool {
        return head == nil
    }
    
    mutating func enqueue(_ data: T) {
        if isEmpty {
            head = Node(data: data)
            tail = head
        }
        
        var node = head
        
        while node?.next != nil {
            node = node?.next
        }
        
        node?.next = Node(data: data)
        tail = node?.next
    }
}
