//
//  File.swift
//  
//
//  Created by Hisop on 2023/11/13.
//

final public class CustomerQueue<T> {
    var list: LinkedList<T>
    
    init(list: LinkedList<T> = LinkedList<T>()) {
        self.list = list
    }
    
    public func isEmpty() -> Bool {
        return list.checkEmpty
    }
    
    public func count() -> Int {
        return list.elementCount
    }
    
    public func peek() -> T? {
        return list.headValue
    }
    
    public func enqueue(value: T) {
        list.addNode(value: value)
    }
    
    @discardableResult
    public func dequeue() -> T? {
        return list.removeNode()
    }
    
    public func clear() {
        list.removeAll()
    }
}
