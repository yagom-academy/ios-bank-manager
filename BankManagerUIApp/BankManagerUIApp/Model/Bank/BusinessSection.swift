//
//  BusinessSection.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/09.
//

import Foundation

final class BusinessSection: BankWorkable {
    var bankDispatchQueue: DispatchQueue
    var bankSemaphore: DispatchSemaphore
    let businessType: BusinessType
    var isWorking: Bool = true
    
    init(queueName: String, businessType: BusinessType, numberOfBankers: Int) {
        self.bankDispatchQueue = DispatchQueue(label: queueName, attributes: .concurrent)
        self.bankSemaphore = DispatchSemaphore(value: numberOfBankers)
        self.businessType = businessType
    }
    
    func processJob(for customer: Customer, group: DispatchGroup) {
        bankDispatchQueue.async(group: group, qos: .default) {
            self.bankSemaphore.wait()
            
            guard self.isWorking else {
                self.bankSemaphore.signal()
                return
            }
            
            self.notifyStartJob(customer: customer)
            Thread.sleep(forTimeInterval: customer.businessType.consultingTime)
            self.notifyFinishJob(customer: customer)
            self.bankSemaphore.signal()
        }
    }
    
    private func notifyStartJob(customer: Customer) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .startJob,
                                            object: self,
                                            userInfo: [NotificationKey.customer: customer])
        }
    }
    
    private func notifyFinishJob(customer: Customer) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .finishJob,
                                            object: self,
                                            userInfo: [NotificationKey.customer: customer])
        }
    }
}
