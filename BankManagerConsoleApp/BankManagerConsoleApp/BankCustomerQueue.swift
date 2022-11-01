//
//  BankCustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/01.
//

struct BankCustomerQueue<DataType: Queueable>: Queue {
    var head: Node<DataType>?
    var tail: Node<DataType>?
    
    mutating func enqueue(_ element: DataType) {
        let node = Node(data: element)
        isEmpty() ? (self.head = node) : (self.tail?.next = node)
        tail = node
    }
    
    mutating func dequeue() -> DataType? {
        guard let head = head else {
            return nil
        }
        
        let data = head.data
        
        if head === self.tail {
            self.tail = nil
        }
        
        self.head = head.next
        
        return data
    }
    
    mutating func clear() {
        self.head = nil
        self.tail = nil
    }
    
    func peek() -> DataType? {
        return self.head?.data
    }
    
    func isEmpty() -> Bool {
        return self.head == nil
    }
}
