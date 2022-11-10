//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by junho, woong on 2022/11/01.
//

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    private(set) var count: Int = 0
    var headData: T? {
        return head?.data
    }
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func addLast(_ element: T) {
        count += 1
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
        count -= 1
        head = first.next
        tail = isEmpty ? nil : tail
        return first.data
    }
    
    mutating func removeAll() {
        count = 0
        head = nil
        tail = nil
    }
}
