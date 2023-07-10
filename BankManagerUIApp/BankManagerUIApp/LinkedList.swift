//
//  LinkedList.swift
//  BankManagerUIApp
//
//  Created by Yetti, Redmango on 2023/07/10.
//

final class LinkedList<Element> {
    var head: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil ? true : false
    }
}
