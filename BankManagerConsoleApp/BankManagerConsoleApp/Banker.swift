//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Yetti, redmango1446 on 2023/07/13.
//
import Foundation

struct Banker {
    private(set) var task: BankTask

    init(task: BankTask) {
        self.task = task
    }

    func work(for customer: Customer) {
        guard let queueNumber = customer.queueNumber else {
            return
        }

        print("\(queueNumber)번 \(task.korean)고객 업무 시작")
        Thread.sleep(forTimeInterval: task.time)
        print("\(queueNumber)번 \(task.korean)고객 업무 종료")
    }

    func notifyWorkTime() -> Double {
        return task.time
    }
}
