//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by JeongTaek Han on 2021/12/20.
//

import Foundation

class Node<Element> {
    var data: Element
    var next: Node?
    
    init(data: Element, next: Node?) {
        self.data = data
        self.next = next
    }
}
