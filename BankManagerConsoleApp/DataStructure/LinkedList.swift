//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by kjs on 2021/07/26.
//

import Foundation

class LinkedList<Type> {
    private(set) var head: Node<Type>?
    private var tail: Node<Type>?
    
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
    
    func remove(target: Node<Type>?) {
        var currentNode = head
        var previousNode: Node<Type>?
        
        while target != currentNode {
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        
        if let previousNode = previousNode {
            previousNode.next = currentNode
        } else {
            head = currentNode?.next
        }
    }
    
    func clear() {
        head = nil
        tail = nil
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = self.head else {
            return .blank
        }
        
        guard head.next != nil else {
            return "[\(head.description)]"
        }
        
        var resultString = "[\(head.description)"
        var node = head.next
        while node != nil {
            resultString += (node?.description ?? .blank)
            if node?.next != nil {
                resultString += ", "
            }
            node = node?.next
        }

        return resultString + "]"
    }
}
