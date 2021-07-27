//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 김태영 on 2021/07/27.
//

import Foundation

protocol Queue {
    func enqueue()
    func dequeue()
    func clear()
    func peek()
    func isEmpty()
}

