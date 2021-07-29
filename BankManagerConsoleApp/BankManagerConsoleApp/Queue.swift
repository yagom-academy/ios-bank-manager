//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by JINHONG AN on 2021/07/29.
//

import Foundation

class Queue<Element> {
    //TODO: enqueue, dequeue, clear, peek, isEmpty
    private var linkedList = LinkedList<Element>()
    
    func enqueue(_ newElement: Element) {
        linkedList.append(data: newElement)
    }
}
