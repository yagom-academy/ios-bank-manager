//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by junho, woong on 2022/11/01.
//

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    var firstValue: T? {
        return head?.data
    }
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func addLast(_ element: T) {
        let newNode: Node<T> = Node(data: element)
        guard let last = tail else {
            head = newNode
            tail = newNode
            return
        }
        last.next = newNode
        tail = newNode
    }
    
    mutating func removeFirst() -> T? {
        guard let first = head else {
            return nil
        }
        head = first.next
        tail = isEmpty ? nil : tail
        return first.data
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
