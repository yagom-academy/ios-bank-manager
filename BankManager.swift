//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// clerk, customer 각각 객체로 만들어도 될 듯 ( 왜냐면 processTime 이 각각 다를 경우 )

final class BankManager {
    // private
    // type 선언 통일! 할지말지
    // number 보단 count
    private let clerkNumber: Int = 1
    private let customerNumber: Int = Int.random(in: 10...30)
    // 0.25 면 100 등등 고려하기
    // 그냥 올림으로 다시 바꾸기 double 해서
    private var _processTime: Int = 7 //{ processTime * 10 }
    public var processTime: Double = 0.7
    
    private let totalTimeKey = DispatchSpecificKey<Int>()
    private let processTimeKey = DispatchSpecificKey<Int>()
    private lazy var clerks: [DispatchQueue] = {
        var clerks: [DispatchQueue] = []
        for index in 0..<clerkNumber {
            let clerk = DispatchQueue(label: "\(index)")
            // 배열로 따로 만들어도 됨
            clerk.setSpecific(key: totalTimeKey, value: 0)
            clerk.setSpecific(key: processTimeKey, value: _processTime)
            clerks.append(clerk)
        }
        
        return clerks
    }()
    private lazy var customers: [Int] = {
        Array(1...customerNumber)
    }()
    //
//    private lazy var clerkTotalTimes: [Int] = {
//        Array(1...customerNumber)
//    }()
    var totalTimes: [Int] = []
    
    func open() {
        if customerNumber <= 0 { return }
    
        let semaphore = DispatchSemaphore(value: 0)
        let bankTaskGroup: DispatchGroup = DispatchGroup()
        
        for index in 0..<clerkNumber {
            bankTaskGroup.enter()
            assignCustomer(customers.removeFirst(), to: clerks[index], group: bankTaskGroup)
            bankTaskGroup.notify(queue: clerks[index]) {
                semaphore.signal()
            }
        }
        
        for _ in 0..<clerkNumber {
            semaphore.wait()
        }
        
        // TODO: Double -> ComputedProperty 로 바꾸기
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerNumber)명이며, 총 업무시간은 \(Double(totalTimes.max()!)/10)초입니다.")
    }
    
    private func assignCustomer(_ customerIndex: Int, to clerk: DispatchQueue, group: DispatchGroup) {
        clerk.async(group: group) {
            // private 함수로 따로 빼도 될듯
            guard let currentTotalTime = clerk.getSpecific(key: self.totalTimeKey),
                  let processTime = clerk.getSpecific(key: self.processTimeKey) else { return }
            
            print("\(customerIndex)번 고객 업무 시작")
            self.sleep(processTime)
            clerk.setSpecific(key: self.totalTimeKey, value: currentTotalTime + processTime)
            print("\(customerIndex)번 고객 업무 완료")
            
            if self.customers.isEmpty {
                guard let finalTotalTime = clerk.getSpecific(key: self.totalTimeKey) else { return }
                self.totalTimes.append(finalTotalTime)
                group.leave()
            } else {
                self.assignCustomer(self.customers.removeFirst(), to: clerk, group: group)
            }
        }
    }
//
//    private func getTimeInfo() -> (Int, Int) {
//
//    }
    
    private func sleep(_ time: Int) {
        let time = useconds_t(time * 100000)
        usleep(time)
    }
}
