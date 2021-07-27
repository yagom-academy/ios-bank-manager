//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by kjs on 2021/07/26.
//

import Foundation

class LinkedList<Type> {
    private(set) var head: Node<Type>?
    private(set) var tail: Node<Type>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(value: Type) {
        let newNode = Node(value: value)
        
        if isEmpty {
            head = newNode
        } else {
            tail?.next = newNode
        }
        tail = newNode
    }
    
    func remove(node: Node<Type>) {
        let argumentIdentity = node.next
        var currentNode = head?.next
        var previousNode: Node<Type>?

        while argumentIdentity != currentNode {
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        
        if let previousNode = previousNode {
            previousNode.next = currentNode?.next
        } else {
            head = currentNode?.next
        }
    }
}
