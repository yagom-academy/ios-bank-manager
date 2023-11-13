//
//  File.swift
//  
//
//  Created by Hisop on 2023/11/13.
//

final public class CustomerQueue<T> {
    private var list = LinkedList<T>()
    
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
    
    public func peek() -> T? {
        return list.headValue
    }
    
    public func isEmpty() -> Bool {
        return list.checkEmpty
    }
    
    public func count() -> Int {
        return list.elementCount
    }
}
