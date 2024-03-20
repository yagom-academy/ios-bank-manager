//
//  File.swift
//  
//
//  Created by Diana, Hamzzi on 3/20/24.
//

struct Banker {
    var totalCustomers: Int = 0
    var totalProcessingTime: Double = 0
    
    mutating func processCustomer(_ customer: Customer) {
        print("\(customer.name) 업무 시작")
        totalCustomers += 1
        totalProcessingTime += customer.processingTime
        print("\(customer.name) 업무 완료")
    }
}
