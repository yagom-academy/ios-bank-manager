//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 쿼카, 두기 on 2022/04/26.
//

import Foundation

final class Node<Element> {
    let data: Element
    var next: Node?
    
    init(date: Element) {
        self.data = date
    }
}
