//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by jyubong, Toy on 11/14/23.
//

final class LinkedList<Data> {
    private var head: Node<Data>?
    private var tail: Node<Data>?
    
    var first: Data? { head?.data }
    
    var last: Data? { tail?.data }
    
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
    
    func removeFirst() -> Data? {
        guard let headData = head?.data else { return nil }
        
        head = head?.next
        
        return headData
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
