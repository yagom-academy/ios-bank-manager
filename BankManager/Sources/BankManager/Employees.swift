//
//  Employees.swift
//
//
//  Created by Hisop on 2023/11/22.
//

import Foundation

final class Employees {
    private(set) var business: Business
    private(set) var semaphore: DispatchSemaphore
    
    init(business: Business, semaphore: DispatchSemaphore) {
        self.business = business
        self.semaphore = semaphore
    }
}
