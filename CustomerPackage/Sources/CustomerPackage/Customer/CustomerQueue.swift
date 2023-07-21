//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/19.
//

public struct CustomerQueue: CustomerQueueable {
    public let linkedList: LinkedList<Customer> = LinkedList()
    
    public init() { }
}
