//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Seul Mac on 2021/12/20.
//

import Foundation

class LinkedList<Element> {
    
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    func append(data: Element) {
        if head == nil {
            head = Node(data: data, next: nil)
            tail = head
        } else {
            tail?.next = Node(data: data, next: nil)
            tail = tail?.next
        }
    }
    
    func removeFirst() throws -> Element {
        guard let currentHead = head else {
            throw LinkedListError.dataDoesNotExist
        }
        
        if head === tail {
            self.tail = nil
        }
        
        let firstData = currentHead.data
        self.head = currentHead.next
        return firstData
    }
    
    func firstData() throws -> Element {
        guard let head = head else {
            throw LinkedListError.dataDoesNotExist
        }
        return head.data
    }
    
    var isEmpty: Bool {
        return head == nil && tail == nil
    }

}
