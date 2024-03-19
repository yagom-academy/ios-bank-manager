//
//  SinglyLinkedList.swift
//
//
//  Created by Danny, Prism on 3/19/24.
//


class SinglyLinkedList {
    class Node<T> {
        var data: T
        var next: Node<T>? = nil
        
        init(data: T) {
            self.data = data
        }
    }
}
