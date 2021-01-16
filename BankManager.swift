//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    enum Grade: String, CaseIterable {
        case VVIP = "VVIP"
        case VIP = "VIP"
        case normal = "일반"
        
        var priority: Int {
            switch self {
            case .VVIP:
                return 0
            case .VIP:
                return 1
            case .normal:
                return 2
            }
        }
    }

    enum Task: String, CaseIterable {
        case loan = "대출"
        case deposit = "예금"
        
        var duration: TimeInterval {
            switch self {
            case .loan:
                return 1.1
            case .deposit:
                return 0.7
            }
        }
    }
    
    class Banker {
        var customer: Customer?
        
        /// 고객이 할당된 은행원이 업무를 수행하는 함수.
        func performTask() {
            guard let customer = self.customer else {
                return
            }
            
            let customerInformation = "\(customer.number)번 \(customer.grade.rawValue) 고객 \(customer.task.rawValue)업무"
            print("\(customerInformation) 시작")
            Thread.sleep(forTimeInterval: customer.task.duration)
            print("\(customerInformation) 완료")
            self.customer = nil
        }
    }
    
    class Customer {
        var number: UInt
        var grade: Grade
        var task: Task
        
        init(number: UInt, grade: Grade, task: Task) {
            self.number = number
            self.grade = grade
            self.task = task
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
    
    class CustomerPriorityQueue {
        var queue: [Customer] = []
        private var lock = NSLock()
        
        var count: Int {
            lock.lock()
            defer { lock.unlock() }
            return queue.count
        }
        
        func enqueue(customer: Customer) {
            lock.lock()
            defer { lock.unlock() }
            queue.append(customer)
            
            var currentIndex = self.queue.count - 1
            var parentIndex = (currentIndex - 1) / 2
            while currentIndex > 0
                    && parentIndex >= 0 {
                if customer.grade.priority > queue[parentIndex].grade.priority
                || (customer.grade.priority == queue[parentIndex].grade.priority
                        && customer.number > queue[parentIndex].number) {
                    break
                }
                queue[currentIndex] = queue[parentIndex]
                currentIndex = parentIndex
                parentIndex = (currentIndex - 1) / 2
            }
            queue[currentIndex] = customer
        }
        
        func dequeue() -> Customer? {
            lock.lock()
            defer { lock.unlock() }
            guard queue.count > 0 else {
                return nil
            }
            
            let firstCustomer = queue.first
            guard let lastCustomer = queue.last else {
                return nil
            }
            queue[0] = lastCustomer
            queue.removeLast()
            if queue.count == 0 {
                return firstCustomer
            }
            var currentIndex = 0
            var leftChildIndex = (currentIndex * 2) + 1
            var rightChildIndex = leftChildIndex + 1
            while leftChildIndex <= self.queue.count - 1 {
                if leftChildIndex + 1 <= self.queue.count - 1 {
                    if queue[leftChildIndex].grade.priority > queue[rightChildIndex].grade.priority
                    || (queue[leftChildIndex].grade.priority == queue[rightChildIndex].grade.priority
                            && queue[leftChildIndex].number > queue[rightChildIndex].number) {
                        leftChildIndex = rightChildIndex
                    }
                }
                if lastCustomer.grade.priority < queue[leftChildIndex].grade.priority
                    || (lastCustomer.grade.priority == queue[leftChildIndex].grade.priority
                            && lastCustomer.number < queue[leftChildIndex].number) {
                    break
                }
                queue[currentIndex] = queue[leftChildIndex]
                currentIndex = leftChildIndex
                leftChildIndex = (leftChildIndex * 2) + 1
                rightChildIndex = leftChildIndex + 1
            }
            queue[currentIndex] = lastCustomer
            
            return firstCustomer
        }
    }
    
    private var bankerCount: UInt
    private var customerCount: UInt
    private var completeCustomerCount: UInt = 0
    private var totalTaskTime: Double = 0
    private var busyBankerQueue = DispatchQueue(label: "busy", attributes: .concurrent)
    private var idleBankerQueue: Queue<Banker> = Queue<Banker>()
    private var customerQueue: CustomerPriorityQueue = CustomerPriorityQueue()
    private var bankerSemaphore: DispatchSemaphore?
    private var bankCloseSemaphore = DispatchSemaphore(value: 0)
    
    init(bankerCount: UInt, customers: [Customer]) {
        self.bankerCount = bankerCount
        self.customerCount = UInt(customers.count)
        self.bankerSemaphore = DispatchSemaphore(value: Int(bankerCount))
        
        initBankers()
        initCustomers(customers)
    }
    
    init(bankerCount: UInt, customerCount: UInt) {
        self.bankerCount = bankerCount
        self.customerCount = customerCount
        self.bankerSemaphore = DispatchSemaphore(value: Int(bankerCount))
        
        initBankers()
        initCutomersByRandom(customerCount)
    }
    
    /// 은행을 개점하고 고객이 더 이상 없으면 폐점하는 함수.
    func openBank() {
        let startTaskTime = Date()
        for _ in 0..<customerQueue.count {
            assignCustomerToBanker()
        }
        if completeCustomerCount < customerCount {
            self.bankCloseSemaphore.wait()
        }
        let totalTaskTime = Date().timeIntervalSince(startTaskTime)
        self.totalTaskTime = Double(totalTaskTime)
        
        self.closeBank()
    }
    
    /// 입력된 고객 배열을 우선순위 큐에 넣는 함수.
    private func initCustomers(_ customers: [Customer]) {
        for customer in customers {
            customerQueue.enqueue(customer: customer)
        }
    }
    
    private func initCutomersByRandom(_ cutomerCount: UInt) {
        for i in 1...customerCount {
            let randomNumberForGrade = Int.random(in: 0..<Grade.allCases.count)
            let randomGrade = Grade.allCases[randomNumberForGrade]
            let randomNumberForTask = Int.random(in: 0..<Task.allCases.count)
            let randomTask = Task.allCases[randomNumberForTask]
            let customer = Customer(number: i, grade: randomGrade, task: randomTask)
            customerQueue.enqueue(customer: customer)
        }
    }
    
    /// 은행원 수 만큼 idleBankerQueue에 은행원 객체를 초기화하는 함수.
    private func initBankers() {
        for _ in 0..<self.bankerCount {
            let banker = Banker()
            idleBankerQueue.enqueue(item: banker)
        }
    }
    
    /// 등급이 높은 고객부터 은행원에 할당하여 업무를 수행하도록 하는 함수.
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
            banker.performTask()
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
