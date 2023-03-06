//
//  LinkedList.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/06.
//

struct LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    var isEmpty: Bool {
        return head == nil
    }
    var peek: T? {
        return self.head?.data
    }
    
    mutating func enqueue(_ data: T) {
        if isEmpty {
            self.head = Node(data: data)
            self.tail = head
            
            return
        }
        
        tail?.next = Node(data: data)
        self.tail = tail?.next
    }
    
    mutating func dequeue() -> T? {
        guard let node = head else { return nil }
        self.head = head?.next
        
        return node.data
    }
    
    mutating func clear() {
        self.head = nil
        self.tail = nil
    }
}
