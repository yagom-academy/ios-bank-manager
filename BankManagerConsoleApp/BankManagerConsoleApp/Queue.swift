//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by jin on 10/31/22.
//

final class Queue<T> {
    private let customerList = LinkedList<T>()
    
    func enqueue(_ customer: T) {
        let customer = Node(customer)
        customerList.push(customer)
    }
    
    func dequeue() -> T? {
        return customerList.pop()?.value
    }
    
    func clear() {
        customerList.removeAll()
    }
    
    func peek() -> T? {
        return customerList.peek()?.value
    }
    
    var isEmpty: Bool {
        return customerList.isEmpty
    }
}
