//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by yonggeun Kim on 2022/10/31.
//

struct Queue<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    var isEmpty: Bool {
        get { return head == nil }
    }
    
    mutating func enqueue(_ value: Element) {
        let newNode: Node<Element> = Node(value: value)
        
        if isEmpty == true {
            head = newNode
        } else {
            tail?.nextNode = newNode
        }
        
        tail = newNode
    }
    
    mutating func dequeue() -> Element? {
        guard let currentHead: Node<Element> = head else {
            return nil
        }
        
        head = head?.nextNode
        
        return currentHead.value
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
    
    func peek() -> Element? {
        return head?.value
    }
}
