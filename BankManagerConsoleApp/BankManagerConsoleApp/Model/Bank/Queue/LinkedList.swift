//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by minsson, Derrick on 2022/06/27.
//

final class LinkedList<Element> {
    private(set) var head: Node<Element>?
    private var tail: Node<Element>?
}

// MARK: - Internal Actions

extension LinkedList {
    func append(_ newNode: Node<Element>) {
        if head == nil {
            head = newNode
            tail = head
            return
        }
        
        tail?.nextNode = newNode
        tail = newNode
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func removeFirst() -> Element? {
        guard let removedNode = head else {
            return nil
        }
        
        head = removedNode.nextNode
        
        return removedNode.data
    }
    
    func removeAll() {
        head = nil
    }
}

