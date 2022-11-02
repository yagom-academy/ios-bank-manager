//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/02.
//

final class Node<T: Equatable> {
    var value: T
    var next: Node?
    
    init(_ value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
