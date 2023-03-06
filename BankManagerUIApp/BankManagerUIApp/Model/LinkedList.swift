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
            self.head = Node(data: data)
            self.tail = head
        }
        
        var node = self.head
        
        while node?.next != nil {
            node = node?.next
        }
        
        node?.next = Node(data: data)
        self.tail = node?.next
    }
    
    mutating func dequeue() -> T? {
        guard let node = head else { return nil }
        self.head = head?.next
        
        return node.data
    }
    
    mutating func clear() {
        while isEmpty {
            self.head = nil
            self.head = head?.next
        }
    }
}
