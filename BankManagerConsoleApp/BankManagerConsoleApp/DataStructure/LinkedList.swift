//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by karen on 2023/07/11.
//

struct LinkedList<Element> {
    private final class Node<Element> {
        let element: Element
        var next: Node?

        init(element: Element) {
            self.element = element
        }
    }
    
    private var head: Node<Element>?
    private var tail: Node<Element>?
    var isEmpty: Bool { return head == nil }
    var peek: Element? { return head?.element }
    
    var headElement: Element? {
        return head?.element
    }

    var nodeElement: Element? {
        return head?.element
    }
    
    mutating func append(_ element: Element) {
        let newNode = Node(element: element)
        
        if isEmpty {
            head = newNode
        } else {
            tail?.next = newNode
        }
        tail = newNode
    }
    
    mutating func removeFirst() -> Element? {
        guard let dequeuedElement = head?.element else { return nil }
        
        if isEmpty {
            head = nil
            tail = nil
        } else {
            head = head?.next
        }
        return dequeuedElement
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
}
