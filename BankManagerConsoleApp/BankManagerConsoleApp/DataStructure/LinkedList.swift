//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/06.
//

final class Node<T> {
    var next: Node? = nil
    let data: T
    
    init(data: T) {
        self.data = data
    }
}

struct LinkedList<T> {
    private(set) var head: Node<T>? = nil
    private(set) var tail: Node<T>? = nil
    private(set) var count: Int = 0
    
    var isEmpty: Bool {
        return self.count == 0
    }
    
    mutating func append(data: T) {
        let node = Node(data: data)
        
        if count == 0 {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
        
        count += 1
    }
    
    mutating func removeFirst() -> Node<T>? {
        guard isEmpty == false else { return nil }
        
        let node = head
        head = head?.next
        count -= 1
        
        if count == 0 {
            tail = nil
        }
        
        return node
    }
    
    mutating func clear() {
        head = nil
        tail = nil
        count = 0
    }
}
