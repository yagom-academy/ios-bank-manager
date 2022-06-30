//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by 보리, 휴 on 2022/06/28.
//
final class Queue<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    init(head: Node<T>? = nil, tail: Node<T>? = nil) {
        self.head = head
        self.tail = tail
    }
    
    private func isEmpty() -> Bool {
        if head == nil {
            return true
        }
        return false
    }
    
    func enqueue(inputData: T?) {
        let inputNode = Node(inputData)
        
        guard !isEmpty() else {
            head = inputNode
            tail = inputNode
            return
        }
        
        inputNode.previousNode = tail
        tail?.nextNode = inputNode
        tail = inputNode
    }
    
    func dequeue() -> T? {
        var firstNode: Node<T>?
        guard !isEmpty() else {
            return firstNode?.data
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
        return firstNode?.data
    }
    
    func peek() -> T? {
        guard !isEmpty() else {
            return nil
        }
        return head?.data
    }
    
    private func clear() {
        while head?.nextNode != nil {
            head = head?.nextNode
            head?.previousNode?.nextNode = nil
            head?.previousNode = nil
        }
        head = nil
        tail = nil
    }
}
