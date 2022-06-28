//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by 보리, 휴 on 2022/06/28.
//
class CustomerQueue<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    init(head: Node<T>? = nil, tail: Node<T>? = nil) {
        self.head = head
        self.tail = head
    }
    
    func isEmpty() -> Bool {
        if head == nil {
            return true
        }
        return false
    }
    
    func enqueue(inputNode: Node<T>?) {
        guard !isEmpty() else {
            head = inputNode
            tail = inputNode
            return
        }
        inputNode?.previousNode = tail
        tail?.nextNode = inputNode
        tail = inputNode
    }
    
    func dequeue() -> Node<T>? {
        var firstNode: Node<T>?
        guard !isEmpty() else {
            return firstNode
        }
        if head?.nextNode == nil {
            firstNode = head
            head = nil
            tail = nil
        } else {
            head = head?.nextNode
            head?.previousNode?.nextNode = nil
            firstNode = head?.previousNode
            head?.previousNode = nil
        }
        return firstNode
    }
    
    func peek() -> Node<T>? {
        guard !isEmpty() else {
            return nil
        }
        return head
    }
    
    func clear() {
        while head?.nextNode != nil {
            head = head?.nextNode
            head?.previousNode?.nextNode = nil
            head?.previousNode = nil
        }
        head = nil
        tail = nil
    }
}
