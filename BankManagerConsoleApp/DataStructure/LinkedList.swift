//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/06.
//

final class LinkedList<T> {
    final private class Node<T> {
        var next: Node?
        let data: T

        init(data: T) {
            self.data = data
        }
    }

    private var head: Node<T>?
    private var tail: Node<T>?
    private(set) var count: Int = 0

    var headData: T? {
        return head?.data
    }

    var isEmpty: Bool {
        return self.count == 0
    }

    func append(data: T) {
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

    func removeFirst() -> T? {
        guard let node = head else { return nil }
        
        head = head?.next
        
        if head == nil {
            tail = nil
        }
        
        count -= 1
        
        return node.data
    }
    
     func clear() {
        head = nil
        tail = nil
        count = 0
    }
}
