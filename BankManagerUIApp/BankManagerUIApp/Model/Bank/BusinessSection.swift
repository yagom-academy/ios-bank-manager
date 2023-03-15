//
//  BusinessSection.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/09.
//

import Foundation

struct BusinessSection: BankWorkable {
    let bankDispatchQueue: DispatchQueue
    let bankSemaphore: DispatchSemaphore
    let businessType: BusinessType
    var completedJobCount: Int = 0
    
    init(queueName: String, businessType: BusinessType, numberOfBankers: Int) {
        self.bankDispatchQueue = DispatchQueue(label: queueName, attributes: .concurrent)
        self.bankSemaphore = DispatchSemaphore(value: numberOfBankers)
        self.businessType = businessType
    }
    
    func processJob(for customer: Customer, group: DispatchGroup) {
        bankDispatchQueue.async(group: group) {
            self.bankSemaphore.wait()
//            print("\(customer.waitingNumber)번 고객 \(customer.businessType.rawValue)업무 시작")
            notifyStartJob(customer: customer)
            Thread.sleep(forTimeInterval: customer.businessType.consultingTime)
//            print("\(customer.waitingNumber)번 고객 \(customer.businessType.rawValue)업무 완료")
            notifyFinishJob(customer: customer)
            self.bankSemaphore.signal()
        }
    }
    
    mutating func addJobCount() {
        completedJobCount += 1
    }
    
    func notifyStartJob(customer: Customer) {
        NotificationCenter.default.post(name: .startJob,
                                        object: self,
                                        userInfo: [NotificationKey.customer: customer])
    }
    
    func notifyFinishJob(customer: Customer) {
        NotificationCenter.default.post(name: .finishJob,
                                        object: self,
                                        userInfo: [NotificationKey.customer: customer])
    }
}
