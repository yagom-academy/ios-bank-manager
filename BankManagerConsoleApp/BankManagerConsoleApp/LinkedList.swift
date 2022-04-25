//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Donnie, Safari on 2022/04/25.
//

import Foundation

protocol Listable {
    associatedtype Element
    var isEmpty: Bool { get }
    var peek: Element? { get }
    
    func append(_ value: Element)
    func removeFirst() -> Element?
    func removeAll()
}

final class Node<T> {
    var value: T
    var next: Node?
    weak var previous: Node?
    
    init(value: T, next: Node? = nil, previous: Node? = nil) {
        self.value = value
    }
}

final class LinkedList<Element>: Listable {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var peek: Element? {
        return head?.value
    }
    
    func append(_ value: Element) {
        let newNode = Node(value: value)
        
        if isEmpty {
            head = newNode
            tail = newNode
            return
        }
        newNode.previous = tail
        tail?.next = newNode
        tail = newNode
    }
    
    @discardableResult
    func removeFirst() -> Element? {
        if isEmpty {
            return nil
        }
        let firstValue = head?.value
        
        if head?.next == nil {
            removeAll()
            return firstValue
        }
        head = head?.next
        return firstValue
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
