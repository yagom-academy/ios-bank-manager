//
//  Node.swift
//  BankManagerUIApp
//
//  Created by Kiseok on 11/13/23.
//

final class Node<T> {
    private(set) var data: T
    var next: Node?
    
    init(data: T) {
        self.data = data
    }
}
