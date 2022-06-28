//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by LeeChiheon on 2022/06/27.
//

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var nodeCount: Int = 0
    lazy var currentNode:Node<T>? = head
    
    mutating func enqueue(data: T) {
        let node = Node<T>(data: data)
        nodeCount += 1
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            node.previous = tail
            tail = node
        }
    }
    
    mutating func dequeue() -> T? {
        nodeCount -= 1
        let returnData = head?.data
        
        head?.next?.previous = nil
        head = head?.next
        
        return returnData
    }
    
    mutating func clear() {
        while nodeCount != 0 {
            head = head?.next
            head?.previous?.next = nil
            head?.previous = nil
            nodeCount -= 1
        }
        
        head = nil
        tail = nil
    }
}

extension LinkedList: Sequence, IteratorProtocol {
    mutating func next() -> T? {
        defer { currentNode = currentNode?.next }
        
        return currentNode?.data
    }
}

extension LinkedList: CustomStringConvertible, CustomDebugStringConvertible {
    var description: String {
        let stringArray = self.map { "\($0)" }
        let returnArrray = stringArray.joined(separator: ", ")
        return "[\(returnArrray)]"
    }
    
    var debugDescription: String {
        let stringArray = self.map { "\($0)" }
        let returnArrray = stringArray.joined(separator: ", ")
        return "[\(returnArrray)]"
    }
}

extension LinkedList: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: T...) {
        self.init()
        elements.forEach { self.enqueue(data: $0) }
    }
}
