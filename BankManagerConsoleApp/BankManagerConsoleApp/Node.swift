//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 레옹아범, 혜모리 on 2023/03/06.
//

final class Node<T> {
    var orderNumber: T
    var next: Node?
    
    init(orderNumber: T, next: Node? = nil) {
        self.orderNumber = orderNumber
        self.next = next
    }
}
