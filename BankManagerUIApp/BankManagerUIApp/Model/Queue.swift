//
//  Queue.swift
//  BankManagerConsoleApp
//
//  created by vetto, kokkilE on 2023/03/06.
//

struct Queue<Element> {
    private(set) var linkedList: LinkedList<Element> = .init()
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    mutating func enqueue(_ data: Element) {
        linkedList.append(data)
    }
    
    mutating func dequeue() -> Element? {
        return linkedList.removeFirst()
    }
    
    mutating func clear() {
        linkedList.clear()
    }
    
    func peek() -> Element? {
        guard let head = linkedList.head else {
            return nil
        }
        
        return head.data
    }
}
