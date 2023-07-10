//
//  WaitingLineQueue.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/10.
//

struct WaitingLineQueue<T> {
    private var waitingLineLinkedList = WaitingLineLinkedList<T>()
    
    var peek: T? {
        let node = waitingLineLinkedList.head
        return node?.value
    }
    
    var isEmpty: Bool {
        return waitingLineLinkedList.head == nil
    }
    
    func enqueue(_ value: T) {
        let node = WaitingLineNode(value: value)
        
        waitingLineLinkedList.append(node)
    }
    
    func dequeue() -> T? {
        return waitingLineLinkedList.removeFirst()?.value
    }
    
    func clear() {
        waitingLineLinkedList.clear()
    }
}
