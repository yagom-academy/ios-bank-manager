//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/01.
//

struct LinkedList<DataType>: List {
    typealias Item = Queueable
    
    private var head: Node<Item>?
    private var tail: Node<Item>?
    
    mutating func pushLast(_ element: Item) {
        let node = Node(data: element)
        isEmpty() ? (self.head = node) : (self.tail?.next = node)
        tail = node
    }
    
    mutating func popFirst() -> Node<Item>? {
        guard let node = self.head else {
            return nil
        }
        
        if self.head === self.tail {
            self.tail = nil
        }
        
        self.head = node.next
        
        return node
    }
    
    mutating func clear() {
        self.head = nil
        self.tail = nil
    }
    
    func peek() -> Node<Item>? {
        return self.head
    }
    
    func isEmpty() -> Bool {
        return self.head == nil
    }
}
