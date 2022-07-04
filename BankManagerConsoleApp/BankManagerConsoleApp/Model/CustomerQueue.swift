//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by 예톤, 웡빙 on 2022/06/27.
//

struct CustomerQueue: Queue {
    private(set) var queue: LinkedList<Customer>
    
    init(elements: [Customer] = []) {
        queue = LinkedList()
        elements.forEach {
            self.enqueue(data: $0)
        }
    }
}
