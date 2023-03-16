//
//  BusinessSection.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/09.
//

import Foundation

class BusinessSection: BankWorkable {
    var bankDispatchQueue: DispatchQueue?
    let bankSemaphore: DispatchSemaphore
    let businessType: BusinessType
    var completedJobCount: Int = 0
    var state: Bool = true
    
    init(queueName: String, businessType: BusinessType, numberOfBankers: Int) {
        self.bankDispatchQueue = DispatchQueue(label: queueName, attributes: .concurrent)
        self.bankSemaphore = DispatchSemaphore(value: numberOfBankers)
        self.businessType = businessType
    }
    
    func processJob(for customer: Customer, group: DispatchGroup) {
        
        guard let bankDispatchQueue = bankDispatchQueue else { return }
        bankDispatchQueue.async(group: group, qos: .default) {
            print("state: \(self.state)")
            guard self.state else { return }
            self.bankSemaphore.wait()
            guard self.state else { return }
            self.notifyStartJob(customer: customer)
            print("\(customer.waitingNumber)번 고객 \(customer.businessType.rawValue)업무 시작")
            Thread.sleep(forTimeInterval: customer.businessType.consultingTime)
            print("\(customer.waitingNumber)번 고객 \(customer.businessType.rawValue)업무 완료")
            print("state: \(self.state)")
            self.notifyFinishJob(customer: customer)
            self.bankSemaphore.signal()
        }
    }
    
    func addJobCount() {
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
    
    func changeState() {
        state.toggle()
    }
}
