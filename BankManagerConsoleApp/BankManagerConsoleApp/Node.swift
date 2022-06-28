//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 휴, 보리사랑 on 2022/06/28.
//
final class Node<T> {
    private(set) var data: T?
    var previousNode: Node?
    var nextNode: Node?
    
    init(previousNode: Node? = nil, _ data: T?, nextNode: Node? = nil) {
        self.previousNode = previousNode
        self.data = data
        self.nextNode = nextNode
    }
}
