//
//  LinkedList.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/06.
//

struct LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    var count: Int = 0
    var isEmpty: Bool {
        return head == nil
    }
    var peek: T? {
        return self.head?.data
    }
    
    mutating func append(_ data: T) {
        guard !isEmpty else {
            self.head = Node(data: data)
            self.tail = head
            count += 1
            
            return
        }
        
        tail?.next = Node(data: data)
        self.tail = tail?.next
        count += 1
    }
    
    mutating func removeFirst() -> T? {
        guard let node = head else { return nil }
        self.head = head?.next
        count -= 1
        
        return node.data
    }
    
    mutating func removeAll() {
        self.head = nil
        self.tail = nil
        count = 0
    }
}
