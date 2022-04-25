//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 조민호 on 2022/04/25.
//

import Foundation

final class LinkedList<Element> {
    final class Node {
        var data: Element
        var next: Node?

        init(data: Element) {
            self.data = data
        }
    }
    
    private var head: Node?
    private var tail: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Element? {
        return head?.data
    }
    
    func append(_ data: Element) {
        let newNode = Node(data: data)
        
        if isEmpty {
            head = newNode
        } else {
            tail?.next = newNode
        }
        
        tail = newNode
    }
    
    func removeFirst() -> Element? {
        guard isEmpty == false else {
            return nil
        }
        
        let removedNode = head
        head = removedNode?.next
        return removedNode?.data
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}


