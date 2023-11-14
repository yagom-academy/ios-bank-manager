//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by jyubong, Toy
//

final class Node<DataType> {
    private(set) var data: DataType
    private(set) var next: Node?
    
    init(data: DataType, next: Node? = nil) {
        self.data = data
        self.next = next
    }
    
    func setNext(to node: Node) {
        self.next = node
    }
}
