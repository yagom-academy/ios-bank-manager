//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/06/28.
//

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var peek: T? {
        return head?.data
    }
    var isEmpty: Bool {
        return head == nil || tail == nil
    }
    
    mutating func append(data: T?) {
        if isEmpty {
            head = Node(data: data)
            tail = head
            return
        }
        
        let lastNode = Node(data: data)
        tail?.next = lastNode
        lastNode.prev = tail
        tail = lastNode
    }
    
    mutating func pop() -> T? {
        if isEmpty {
            return nil
        }
        
        let item = head?.data
        head = head?.next
        head?.prev = nil
        return item
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
