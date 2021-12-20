//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 이승재 on 2021/12/20.
//

import Foundation

struct Queue<Element> {
    var items: LinkedList<Element>
    
    init() {
        self.items = LinkedList()
    }
}
