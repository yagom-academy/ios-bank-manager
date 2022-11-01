//  Created by stone, 애종 on 2022/11/01.

import Foundation

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?

    var headData: T? {
        return head?.data
    }
    
    var isEmpty: Bool {
        return self.head == nil
    }
    
    mutating func appendNode(_ value: T) {
        let node = Node<T>(data: value)
        
        if self.isEmpty {
            self.head = node
        }
        
        self.tail?.next = node
        self.tail = node
    }
    
    mutating func removeHead() -> T? {
        guard !self.isEmpty else { return nil }
        
        if self.head === self.tail {
            self.tail = nil
        }
        let removedValue = self.head?.data
        
        self.head = self.head?.next
        
        return removedValue
    }
    
    mutating func removeAll() {
        self.head = nil
        self.tail = nil
    }
}
