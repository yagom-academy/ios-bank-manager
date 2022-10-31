//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by jeremy, LJ on 2022/10/31.
//

import Foundation

struct CustomerQueue<Element> {
    private var front: Node<Element>?
    private var rear: Node<Element>?
}
