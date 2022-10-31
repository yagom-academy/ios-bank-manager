//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by jin on 10/31/22.
//

class CustomerQueue<T> {
    
    let customerList = LinkedList<T>()
    
    func enqueue(_ customer: T) {
        let customer = Node(customer)
        customerList.push(customer)
    }
    
    func dequeue() -> T? {
        return customerList.pop()?.value
    }
}
