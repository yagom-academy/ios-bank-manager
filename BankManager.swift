//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    class Banker {
        var customer: Customer?
        
        /// 고객이 할당된 은행원이 업무를 수행하는 함수.
        /// - Parameter duration: 진행할 업무의 수행 시간.
        func performTask(duration: TimeInterval) {
            guard let customer = self.customer else {
                return
            }
            
            print("\(customer.number)번 고객 업무 시작")
            Thread.sleep(forTimeInterval: duration)
            print("\(customer.number)번 고객 업무 완료")
            self.customer = nil
        }
    }
    
    class Customer {
        var number: UInt
        
        init(number: UInt) {
            self.number = number
        }
    }
    
    class Queue<T> {
        private var queue: [T] = []
        private var lock = NSLock()
        
        var count: Int {
            lock.lock()
            defer { lock.unlock() }
            return queue.count
        }
        
        func enqueue(item: T) {
            lock.lock()
            defer { lock.unlock() }
            queue.append(item)
        }
        
        func dequeue() -> T? {
            lock.lock()
            defer { lock.unlock() }
            guard queue.count > 0 else {
                return nil
            }
            return queue.removeFirst()
        }
    }
    
    private var bankerCount: UInt
    private var customerCount: UInt
    private var completeCustomerCount: UInt = 0
    private var totalTaskTime: Double = 0
    private var busyBankerQueue = DispatchQueue(label: "busy", attributes: .concurrent)
    private var idleBankerQueue: Queue<Banker> = Queue<Banker>()
    private var customerQueue: Queue<Customer> = Queue<Customer>()
    private var bankerSemaphore: DispatchSemaphore?
    private var bankCloseSemaphore = DispatchSemaphore(value: 0)
    
    init(bankerCount: UInt, customerCount: UInt) {
        self.bankerCount = bankerCount
        self.customerCount = customerCount
        self.bankerSemaphore = DispatchSemaphore(value: Int(bankerCount))
    }
    
    /// 은행을 개점하는 함수. 고객이 더 이상 없으면 폐점한다.
    func openBank() {
        setBanker()
        setCustomer()
        
        let startTaskTime = Date()
        for _ in 0..<customerQueue.count {
            assignCustomerToBanker()
        }
        self.bankCloseSemaphore.wait()
        let totalTaskTime = Date().timeIntervalSince(startTaskTime)
        self.totalTaskTime = Double(totalTaskTime)
        
        self.closeBank()
    }
    
    /// 고객의 수 만큼 customerQueue에 고객 객체를 초기화하는 함수.
    private func setCustomer() {
        for number in 1...customerCount {
            let customer = Customer(number: number)
            customerQueue.enqueue(item: customer)
        }
    }
    
    /// 은행원 수 만큼 idleBankerQueue에 은행원 객체를 초기화하는 함수.
    private func setBanker() {
        for _ in 0..<self.bankerCount {
            let banker = Banker()
            idleBankerQueue.enqueue(item: banker)
        }
    }
    
    /// 가장 먼저 온 고객부터 은행원에 할당하여 업무를 하도록 하는 함수.
    private func assignCustomerToBanker() {
        guard let bankerSemaphore = self.bankerSemaphore else {
            return
        }
        
        bankerSemaphore.wait()
        guard let banker = idleBankerQueue.dequeue() else {
            return
        }
        let customer = customerQueue.dequeue()
        banker.customer = customer
        
        busyBankerQueue.async {
            banker.performTask(duration: 0.7)
            self.idleBankerQueue.enqueue(item: banker)
            self.completeCustomerCount += 1
            bankerSemaphore.signal()
            if self.completeCustomerCount == self.customerCount {
                self.bankCloseSemaphore.signal()
            }
        }
    }
    
    /// 은행을 폐점하는 함수. 총 고객수와 업무시간을 출력한다.
    private func closeBank() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(self.completeCustomerCount)명이며, 총 업무시간은 \(String(format: "%.2f", self.totalTaskTime))초입니다.")
    }
}

class Step2BankManager: BankManager {
    
    class PrioritiyQueue<T>: Queue<T> {
        
    }

}
