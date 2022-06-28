//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by LeeChiheon on 2022/06/27.
//

struct Queue<T: Equatable> {
    private var linkedList = LinkedList<T>()
    var isEmpty: Bool {
        linkedList.nodeCount == 0 ? true : false
    }
    var peek: T? {
        linkedList.head?.data
    }
    
    mutating func enqueue(data: T) {
        linkedList.enqueue(data: data)
    }
    
    mutating func dequeue() -> T? {
        return linkedList.dequeue()
    }
    
    mutating func clear() {
        linkedList.clear()
    }
}

extension Queue: Sequence, IteratorProtocol {
    mutating func next() -> T? {
        return linkedList.next()
    }
}

extension Queue: CustomStringConvertible, CustomDebugStringConvertible {
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

extension Queue: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: T...) {
        self.init()
        elements.forEach { self.enqueue(data: $0) }
    }
}

extension Queue: Equatable {
    static func == (lhs: Queue<T>, rhs: Queue<T>) -> Bool {
        guard lhs.linkedList.nodeCount == rhs.linkedList.nodeCount else { return false }
        
        for (lhsElement, rhsElement) in zip(lhs, rhs) {
            guard lhsElement == rhsElement else { return false }
        }
        
        return true
    }
}
