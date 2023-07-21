//
//  Queueable.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/10.
//

public protocol Queueable {
    associatedtype Element
    
    var linkedList: LinkedList<Element> { get }
    var peek: Element? { get }
    var isEmpty: Bool { get }
    
    func enqueue(_ value: Element)
    func dequeue() -> Element?
    func clear()
}

extension Queueable {
    public var peek: Element? {
        let node = linkedList.head
        return node?.value
    }
    
    public var isEmpty: Bool {
        return linkedList.head == nil
    }
    
    public func enqueue(_ value: Element) {
        let node = Node(value: value)
        
        linkedList.append(node)
    }
    
    public func dequeue() -> Element? {
        return linkedList.removeFirst()?.value
    }
    
    public func clear() {
        linkedList.clear()
    }
}
