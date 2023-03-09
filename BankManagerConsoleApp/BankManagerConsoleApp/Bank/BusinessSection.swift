//
//  BusinessSection.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/09.
//

import Foundation

struct BusinessSection: BankWorkable {
    let bankDispatchQueue: DispatchQueue
    let businessType: BusinessType
    let bankSemaphore: DispatchSemaphore
    var completedJobCount: Int = 0
    
    init(queueName: String, businessType: BusinessType, numberOfBankers: Int) {
        self.bankDispatchQueue = DispatchQueue(label: queueName, attributes: .concurrent)
        self.businessType = businessType
        self.bankSemaphore = DispatchSemaphore(value: numberOfBankers)
    }
}
