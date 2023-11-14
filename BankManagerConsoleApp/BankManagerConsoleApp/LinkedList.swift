//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by jyubong, Toy on 11/14/23.
//

import Foundation

final class LinkedList<Data> {
    private var head: Node<Data>?
    private var tail: Node<Data>?
    
    var isEmpty: Bool { head == nil }
    
    func append(value: Data) {
        let newNode: Node = Node(data: value)
        if isEmpty {
            head = newNode
            tail = head
        } else {
            tail?.setNext(to: newNode)
            tail = newNode
        }
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
