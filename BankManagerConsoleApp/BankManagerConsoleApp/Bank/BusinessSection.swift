//
//  BusinessSection.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/09.
//

import Foundation

struct BusinessSection: BankWorkable {
    let dispatchGroup: DispatchGroup
    let bankDispatchQueue: DispatchQueue
    let bankSemaphore: DispatchSemaphore
    let businessType: BusinessType
    var completedJobCount: Int = 0
    
    init(group: DispatchGroup, queueName: String, businessType: BusinessType, numberOfBankers: Int) {
        self.dispatchGroup = group
        self.bankDispatchQueue = DispatchQueue(label: queueName, attributes: .concurrent)
        self.bankSemaphore = DispatchSemaphore(value: numberOfBankers)
        self.businessType = businessType
    }
}
