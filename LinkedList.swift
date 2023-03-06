//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/06.
//

final class Node<T> {
    var previous: Node? = nil
    var next: Node? = nil
    let data: T
    
    init(data: T) {
        self.data = data
    }
}

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var count: Int
    
    var isEmpty: Bool {
        return self.count == 0
    }
    
    mutating func append(data: T) {
        let node = Node(data: data)
        
        if head == nil {
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
        
        return node
    }
}
