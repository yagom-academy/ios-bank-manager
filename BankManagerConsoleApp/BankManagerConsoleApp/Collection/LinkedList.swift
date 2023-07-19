//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by yyss99, 비모 on 2023/07/10.
//

struct LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    private(set) var count: Int = 0
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Element? {
        return head?.data
    }
    
    mutating func append(_ newElement: Element) {
        let newNode = Node(data: newElement)
        
        if isEmpty {
            head = newNode
            tail = newNode
        }
        
        tail?.next = newNode
        tail = newNode
        count += 1
    }
    
    mutating func popFirst() -> Element? {
        guard let data = head?.data else {
            return nil
        }
        
        head = head?.next
        count -= 1
        
        return data
    }
    
    mutating func clear() {
        head = nil
        tail = nil
        count = 0
    }
}
