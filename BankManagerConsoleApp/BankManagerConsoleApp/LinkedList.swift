//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Gordon Choi on 2022/06/28.
//

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    init() {}
}

extension LinkedList {
    var isEmpty: Bool {
        return head == nil
    }
    
    var peek: T? {
        return head?.value
    }
    
    var isNotEmpty: Bool {
        return !isEmpty
    }
}

extension LinkedList {
    mutating func append(_ value: T) {
        let node = Node(value: value, next: nil)
        
        if isEmpty {
            head = node
            tail = head
        } else {
            tail?.next = node
            tail = tail?.next
        }
    }
    
    mutating func pop() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
    
    mutating func removeAll() {
        while isNotEmpty {
            head = head?.next
        }
        
        tail = nil
    }
}
