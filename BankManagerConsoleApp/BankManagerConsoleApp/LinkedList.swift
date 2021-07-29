//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Charlotte, Soll on 2021/07/28.
//

import Foundation

struct LinkedList<T> {
    private var head: Node<T>? = nil
    private var tail: Node<T>? = nil
    private var count: Int = 0
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    mutating func append(_ value: T) {
        let newNode = Node<T>(value: value)
        if isEmpty() {
            head = newNode
        } else {
            tail?.next = newNode
        }
        tail = newNode
        increaseCount()
    }
    
    mutating func checkValueOfFirstNode() -> T? {
        return head?.value
    }
    
    mutating func removeFirstNode() -> T? {
        guard let checkedNode = checkValueOfFirstNode() else { return nil }
        let nextNode = head?.next
        head?.value = nil
        head?.next = nil
        head = nextNode
        decreaseCount()
        return checkedNode
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
    
    mutating func increaseCount() {
        count += 1
    }
    
    mutating func decreaseCount() {
        count -= 1
    }
}
