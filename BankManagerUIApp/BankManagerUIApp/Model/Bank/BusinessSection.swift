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
        bankDispatchQueue.async(group: group, qos: .default) {
            self.bankSemaphore.wait()
            notifyStartJob(customer: customer)
            Thread.sleep(forTimeInterval: customer.businessType.consultingTime)
            notifyFinishJob(customer: customer)
            self.bankSemaphore.signal()
        }
    }
    
    mutating func addJobCount() {
        completedJobCount += 1
    }
    
    func notifyStartJob(customer: Customer) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .startJob,
                                            object: self,
                                            userInfo: [NotificationKey.customer: customer])
        }
    }
    
    func notifyFinishJob(customer: Customer) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .finishJob,
                                            object: self,
                                            userInfo: [NotificationKey.customer: customer])
        }
    }
}
