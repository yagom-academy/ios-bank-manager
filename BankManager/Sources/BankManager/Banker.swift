//
//  File.swift
//  
//
//  Created by Diana, Hamzzi on 3/20/24.
//

import Foundation

struct Banker {
    var id: Int
    var totalCustomers: Int = 0
    var totalProcessingTime: Double = 0
    
    func processCustomer(_ customer: Customer) async throws {
        print("\(customer.name) 업무 시작")
        
        if #available(iOS 13.0, *), #available(macOS 10.15, *) {
            try await Task.sleep(nanoseconds: 700_000_000)
        }
        
        print("\(customer.name) 업무 완료")
    }
}
