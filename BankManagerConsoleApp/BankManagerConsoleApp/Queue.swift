//  Created by stone, 애종 on 2022/11/01.

struct Queue<T> {
    var linkedList = LinkedList<T>()
    
    var peek: T? {
        return linkedList.headData
    }
    
    var isEmpty: Bool {
        return self.linkedList.isEmpty
    }
    
    mutating func enqueue(_ item: T) {
        self.linkedList.appendNode(item)
    }
    
    mutating func dequeue() -> T? {
        return self.linkedList.removeHead()
    }
    
    mutating func clear() {
        self.linkedList.removeAll()
    }
}
