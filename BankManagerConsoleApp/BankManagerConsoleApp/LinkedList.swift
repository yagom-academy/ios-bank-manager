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
    
    mutating func appendNode(_ node: T) {
        
    }
    
    mutating func removeHead() -> T? {
        return self.head?.data
    }
    
    mutating func removeAll() {
        self.head = nil
        self.tail = nil
    }
}
