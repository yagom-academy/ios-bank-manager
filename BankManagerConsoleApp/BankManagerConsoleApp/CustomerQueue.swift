//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by JeongTaek Han on 2021/12/21.
//

import Foundation

struct CustomerQueue<Element> {
    var linkedList = LinkedList<Element>()
    
    func enqueue(data: Element) {
        linkedList.append(data: data)
    }
}
