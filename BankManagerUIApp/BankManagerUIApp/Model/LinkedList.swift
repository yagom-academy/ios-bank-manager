//
//  LinkedList.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/06.
//

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var isEmpty: Bool {
        return head == nil
    }
}
