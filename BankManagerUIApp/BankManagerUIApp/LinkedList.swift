//
//  LinkedList.swift
//  BankManagerUIApp
//
//  Created by Yetti, Redmango on 2023/07/10.
//

struct LinkedList<Element> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil ? true : false
    }
    
    var peek: Element? {
        return head?.data
    }
}
