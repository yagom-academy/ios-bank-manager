//
//  BankCustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/01.
//

struct BankCustomerQueue<DataType: Queueable>: Queue {
    var head: Node<DataType>?
    var tail: Node<DataType>?
    
    mutating func enqueue(_ element: DataType) {
        <#code#>
    }
    
    mutating func dequeue() -> DataType? {
        <#code#>
    }
    
    mutating func clear() {
        <#code#>
    }
    
    func peek() -> DataType? {
        <#code#>
    }
    
    func isEmpty() -> Bool {
        <#code#>
    }
}
