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

    class NotificationBoard {
        var observers: [CustomerQueue] = []
        
        func addObserver(_ observer: CustomerQueue) {
            observers.append(observer)
        }
        
        func removeObserver(_ observer: CustomerQueue) {
            observers.removeAll(where: $0.name == observer.name)
        }
        
        func call(by teller: Teller) {
            floatOnBoard(by: teller)
        }
        
        func floatOnBoard(by teller: Teller) {
            for customerQueue in observers {
                guard let customer = customerQueue.dequeue() else { continue }
                customer.go(to: teller)
            }
        }
    }
    
    class Teller {}

    struct CustomerQueue {}

    class Customer {}
}
