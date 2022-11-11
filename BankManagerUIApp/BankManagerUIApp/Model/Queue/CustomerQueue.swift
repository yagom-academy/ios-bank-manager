//  BankManagerConsoleApp - CustomerQueue.swift
//  Created by Ayaan/Dragon/som on 2022/11/04.
//  Copyright © yagom academy. All rights reserved.

struct CustomerQueue: Queue {
    typealias Element = Customer
    var linkedList: LinkedList<Element> = LinkedList<Element>()
}
