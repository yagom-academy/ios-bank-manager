//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 이차민 on 2021/12/20.
//

import Foundation

class LinkedList<Element> {
    class Node {
        var value: Element
        var next: Node?
        
        init(value: Element) {
            self.value = value
        }
    }
    
    private var head: Node?
    private var tail: Node?
    
    var isEmpty: Bool {
        head == nil
    }
    
    func append(value: Element) {
        let node = Node(value: value)
        
        if let tailNode = tail {
            tailNode.next = node
        } else {
            head = node
        }
        
        tail = node
    }
    
    func removeFirst() -> Element? {
        let firstNode = head
        head = head?.next
        return firstNode?.value
    }
    
    func retrieveFirst() -> Element? {
        return head?.value
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
    
    func returnAll() -> [Element] {
        var elements = [Element]()
        var newHead = head
        
        while let val = newHead?.value {
            elements.append(val)
            newHead = newHead?.next
        }
        
        return elements
    }
}

