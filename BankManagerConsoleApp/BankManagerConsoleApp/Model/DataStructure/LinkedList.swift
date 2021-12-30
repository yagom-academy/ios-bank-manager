//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Jae-hoon Sim on 2021/12/20.
//

import Foundation

final class LinkedList<Element> {
    
    private final class Node<Value> {
        
        var value: Value
        var next: Node<Value>?
        
        init(_ value: Value) {
            self.value = value
        }
    }
    
    private let linkedListSerialQueue = DispatchQueue(label: "linkedListSerialQueue")
    private var head: Node<Element>?
    private var tail: Node<Element>?
    var isEmpty: Bool {
        return head == nil
    }
    var first: Element? {
        return head?.value
    }
    
    func append(_ value: Element) {
        guard isEmpty == false else {
            head = Node(value)
            tail = head
            return
        }
        tail?.next = Node(value)
        tail = tail?.next
    }
    
    func removeFirst() -> Element? {
        var result: Element?
        linkedListSerialQueue.sync {
            guard let firstNode = head else {
                return
            }
            result = firstNode.value
            head = firstNode.next
        }
        return result
    } 
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
