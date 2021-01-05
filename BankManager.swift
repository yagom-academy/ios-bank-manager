//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    let clerkNumber: Int = 3
    //let customerNumber: Int = Int.random(in: 10...30)
    let customerNumber: Int = Int.random(in: 5...10)
    
    var clerks: [DispatchQueue] = []
    var customers: [Int] = []
    
    let totalTimeKey = DispatchSpecificKey<Double>()
    let processTimeKey = DispatchSpecificKey<Double>()
    var totalTimes: [Double] = [] //{
//        didSet {
//            print(totalTimes.count)
//            print(totalTimes)
//            if totalTimes.count == clerkNumber {
//                print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerNumber)명이며, 총 업무시간은 \(totalTimes.max()!)초입니다.")
//            }
//        }
    //}
    
    var bankTaskGroup: DispatchGroup = DispatchGroup()
    
    init() {
        for i in 0..<clerkNumber {
            let clerk = DispatchQueue(label: "\(i)")
            clerk.setSpecific(key: totalTimeKey, value: 0)
            clerk.setSpecific(key: processTimeKey, value: 0.7)
            clerks.append(clerk)
        }
        customers = Array(1...customerNumber)
    }
    
    func open() {
        print("customerNumber: \(customerNumber)")
        if customerNumber <= 0 { return }
    
        for index in 0..<clerkNumber {
            bankTaskGroup.enter()
            print("enter")
            assignCustomer(customers.removeFirst(), to: clerks[index])
        }
        
        bankTaskGroup.notify(queue: .main) {
            print("모든 작업 완료!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        }
    }
    
    private func assignCustomer(_ customerIndex: Int, to clerk: DispatchQueue) {
        clerk.async(group: bankTaskGroup) {
            print("\(customerIndex)번 고객 업무 시작")
            usleep(700000) // 0.7s
            
            guard let currentTotalTime = clerk.getSpecific(key: self.totalTimeKey),
                  let processTime = clerk.getSpecific(key: self.processTimeKey) else {
                return
            }
            clerk.setSpecific(key: self.totalTimeKey, value: currentTotalTime + processTime)
            print("\(customerIndex)번 고객 업무 완료")
            
            if self.customers.isEmpty {
                guard let finalTotalTime = clerk.getSpecific(key: self.totalTimeKey) else { return }
                print("\(clerk.label) 번 은행원의 업무가 끝났습니다. ( 총 걸린시간 : \(finalTotalTime) )")
                self.totalTimes.append(finalTotalTime)
                self.bankTaskGroup.leave()
                print("leave")
            } else {
                self.assignCustomer(self.customers.removeFirst(), to: clerk)
            }
        }
    }
}
