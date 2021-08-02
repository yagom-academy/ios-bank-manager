//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Yongwoo Marco on 2021/07/31.
//

import Foundation

protocol Taskable {
    var task: Task { get }
}

struct Client: Taskable {
    let waitingNumber: Int
    let task: Task = Task.randomElement
}
