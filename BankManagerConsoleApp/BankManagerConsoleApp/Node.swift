//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 김준건 on 2021/07/27.
//

import Foundation

final class Node<T> {
    var data: T
    var link: Node?
    
    init(data: T, link: Node?) {
        self.data = data
        self.link = link
    }
}
