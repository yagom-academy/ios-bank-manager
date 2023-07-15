//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by idinaloq, EtialMoon on 2023/07/10.
//

final class Node<Value> {
    let data: Value
    var next: Node<Value>?
    
    init(data: Value, next: Node<Value>? = nil) {
        self.data = data
        self.next = next
    }
}
