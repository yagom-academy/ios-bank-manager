//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by tae hoon park on 2021/07/27.
//

import Foundation

class Node <T> {
    var previous: Node<T>?
    weak var next: Node<T>?
    var value: T
    
    init(value: T) {
        self.value = value
    }
    
    deinit {
        print("사라짐 \(value)")
    }
}

class LinkedList <T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func peek() -> T? {
        guard let head = head else {
            return nil
        }
        return head.value
    }
    
    func clear() {
        head = nil
        tail = nil
    }
    
    func getFirst() -> Node<T>? {
        return head
    }
    
    func getLast() -> Node<T>? {
        return tail
    }
    
    func append(value: T) {
        let newNode = Node(value: value)
        if let tailNode = tail {
            tailNode.next = newNode
            newNode.previous = tailNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    func removeFirst() {
        guard let headNode = head else {
            return
        }
        if let newHead = headNode.next {
            newHead.previous = nil
            head = newHead
        } else {
            head = nil
            tail = nil
        }
    }
}


