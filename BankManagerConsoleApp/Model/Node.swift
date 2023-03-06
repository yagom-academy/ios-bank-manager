//
//  Node.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/06.
//

final class Node<T> {
    let data: T
    var next: Node<T>?
    
    init(data: T, next: Node<T>? = nil) {
        self.data = data
        self.next = next
    }
}
