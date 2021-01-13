//
//  Clerk.swift
//  BankManagerConsoleApp
//
//  Created by 김지혜 on 2021/01/13.
//

import Foundation

struct Clerk {
    var number: Int
    var queue: DispatchQueue
    
    init(_ index: Int) {
        number = index
        queue = DispatchQueue(label: "\(index)")
    }
    
    func doTask(customer: Customer) {
        print("\(customer.number)번 \(String(describing: customer.level))고객 \(String(describing: customer.task))업무 시작")
        self.sleep(customer.task.processTime)
        print("\(customer.number)번 \(String(describing: customer.level))고객 \(String(describing: customer.task))업무 완료")
    }
    
    private func sleep(_ time: Double) {
        let time: useconds_t = useconds_t(time * 1_000_000)
        usleep(time)
    }
}
