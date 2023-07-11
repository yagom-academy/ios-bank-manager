//
//  LinkedList.swift
//  BankManagerUIApp
//
//  Created by Yetti, Redmango on 2023/07/10.
//

protocol LinkedListable {
    associatedtype Element
 
    var peek: Element? { get }
    var isEmpty: Bool { get }
    
    mutating func clear()
    mutating func addLast(_ data: Element)
    mutating func popFirst() -> Element?
}

struct LinkedList<Element>: LinkedListable {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil ? true : false
    }
    
    var peek: Element? {
        return head?.data
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
    
    mutating func addLast(_ data: Element) {
        let newData = Node(data: data)
        
        if isEmpty {
            head = newData
            tail = newData
        } else {
            tail?.next = newData
            tail = newData
        }
    }
    
    mutating func popFirst() -> Element? {
        guard let data = head?.data else {
            return nil
        }
        
        head = head?.next
        
        return data
    }
}
