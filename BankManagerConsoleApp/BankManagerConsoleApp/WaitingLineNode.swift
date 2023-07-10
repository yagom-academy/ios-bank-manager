//
//  WaitingLineNode.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/10.
//

final class WaitingLineNode<T> {
    var value: T
    var next: WaitingLineNode?
    
    init(value: T, next: WaitingLineNode? = nil) {
        self.value = value
    }
}
