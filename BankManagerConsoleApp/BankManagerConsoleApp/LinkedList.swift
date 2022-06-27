//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by bonf, judy on 2022/06/27.
//

class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?

    var isEmpty: Bool {
        return self.head == nil
    }

    func returnFirst() -> Node<T>? {
        if let node = head {
            return node
        }
        return nil
    }

    func append(_ value: T) {
        let newNode = Node<T>(value)

        if let tailNode = tail {
            tail = newNode
            tailNode.next = tail
        } else {
            head = newNode
            tail = newNode
        }
    }

    func removeHead() -> Node<T>? {
        if let node = head {
            self.head = head?.next
            return node
        } else {
            self.head = nil
            self.tail = nil
            return self.head
        }
    }

    func removeAll() {
        while self.head?.next == self.tail {
            let next = self.head?.next
            self.head = nil
            self.head = next
        }
        self.head = nil
        self.tail = nil
    }
}
