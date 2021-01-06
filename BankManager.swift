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
        /// - Parameter taskTime: 진행할 업무의 수행 시간.
        func performTask(taskTime: Double) {
            guard let customer = self.customer else {
                return
            }
            
            print("\(customer.number)번 고객 업무 시작")
            let sleepTime = useconds_t(taskTime * 1000000)
            usleep(sleepTime)
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

    private var bankerCount: UInt
    private var customerCount: UInt
    private var completeCustomerCount: UInt = 0
    private var totalTaskTime: Double = 0
    private var busyBankerQueue = DispatchQueue(label: "busy", attributes: .concurrent)
    private var idleBankerQueue: [Banker] = []
    private var customerQueue: [Customer] = []
    
    init(bankerCount: UInt, customerCount: UInt) {
        self.bankerCount = bankerCount
        self.customerCount = customerCount
    }
    
    /// 은행을 개점하는 함수. 고객이 더 이상 없으면 폐점한다.
    func openBank() {
        setBanker()
        setCustomer()
        
        let startTaskTime = CFAbsoluteTimeGetCurrent()
        while !(customerQueue.isEmpty) {
            assignTask()
        }
        waitAllBankerTaskDone()
        let totalTaskTime = CFAbsoluteTimeGetCurrent() - startTaskTime
        self.totalTaskTime = Double(totalTaskTime)
        
        closeBank()
    }
    
    /// 모든 은행원이 업무를 끝날때까지 기다리는 함수.
    private func waitAllBankerTaskDone() {
        while idleBankerQueue.count != bankerCount {}
    }
    
    /// 고객의 수 만큼 customerQueue에 고객 객체를 초기화하는 함수.
    private func setCustomer() {
        for number in 1...customerCount {
            let customer = Customer(number: number)
            customerQueue.append(customer)
        }
    }
    
    /// 은행원 수 만큼 idleBankerQueue에 은행원 객체를 초기화하는 함수.
    private func setBanker() {
        for _ in 0..<self.bankerCount {
            let banker = Banker()
            idleBankerQueue.append(banker)
        }
    }
    
    /// 가장 먼저 온 고객부터 은행원에 할당하여 업무를 하도록 하는 함수.
    private func assignTask() {
        // TODO: Banker가 2명 이상일 경우 Race Condition 발생하므로 해결해야됨.
        guard idleBankerQueue.count > 0 else {
            return
        }
        
        let banker = idleBankerQueue.removeFirst()
        let customer = customerQueue.removeFirst()
        banker.customer = customer
        
        busyBankerQueue.async {
            banker.performTask(taskTime: 0.7)
            self.idleBankerQueue.append(banker)
            self.completeCustomerCount += 1
        }
    }
    
    /// 은행을 폐점하는 함수. 총 고객수와 업무시간을 출력한다.
    private func closeBank() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(self.completeCustomerCount)명이며, 총 업무시간은 \(String(format: "%.2f", self.totalTaskTime))초입니다.")
    }
}
