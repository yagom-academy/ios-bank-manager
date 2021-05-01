//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by musun129 on 2021/04/30.
//

import Foundation

class Bank {
    var counters: [Teller] = []
    let customerQueue: CustomerQueue = CustomerQueue()
    let notificationBoard: NotificationBoard = NotificationBoard()

    class NotificationBoard {}

    class Teller {}

    struct CustomerQueue {}

    class Customer {}
}
