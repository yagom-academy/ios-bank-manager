//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by musun129 on 2021/04/30.
//

import Foundation

class Bank {
    var counters: [Teller] = []
    let customerQueue: CustomerQueue = CustomerQueue(name: "고객 대기열")
    let notificationBoard: NotificationBoard = NotificationBoard()

    class NotificationBoard {
        private(set) var observers: [CustomerQueue] = []

        func addObserver(_ observer: CustomerQueue) {
            observers.append(observer)
        }

        func removeObserver(_ observer: CustomerQueue) {
            observers.removeAll(where: { $0.name == observer.name })
        }

        func call(sender teller: Teller) {
            floatOnBoard(sender: teller)
        }

        private func floatOnBoard(sender teller: Teller) {
            for index in 0..<observers.count {
                guard let customer = observers[index].dequeue() else { continue }
                customer.go(to: teller, sender: self)
            }
        }
    }

    class Teller {
        let counterNumber: Int

        init(counterNumber: Int) {
            self.counterNumber = counterNumber
        }

        func work(forCustomerOf waitingNumber: Int, sender notificationBoard: NotificationBoard) {
            print("\(waitingNumber)번 고객 업무 시작")
            Thread.sleep(forTimeInterval: Constants.Teller.taskTime)
            print("\(waitingNumber)번 고객 업무 완료")
            call(to: notificationBoard)
        }

        private func call(to notificationBoard: NotificationBoard) {
            notificationBoard.call(sender: self)
        }
    }

    class CustomerQueue {
        private(set) var queue: [Customer] = []
        let name: String

        init(name: String) {
            self.name = name
        }

        func enqueue(_ customer: Customer) {
            queue.append(customer)
        }

        func dequeue() -> Customer? {
            guard false == queue.isEmpty else { return nil }
            return queue.removeFirst()
        }
    }

    class Customer {
        let waitingNumber: Int

        init(waitingNumber: Int) {
            self.waitingNumber = waitingNumber + 1
        }

        func go(to teller: Teller, sender notificationBoard: NotificationBoard) {
            teller.work(forCustomerOf: self.waitingNumber, sender: notificationBoard)
        }
    }
}
