//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 이차민 on 2021/12/20.
//

import Foundation

class LinkedList<Element> {
    class Node {
        var value: Element
        var next: Node?
        
        init(value: Element) {
            self.value = value
        }
    }
}
