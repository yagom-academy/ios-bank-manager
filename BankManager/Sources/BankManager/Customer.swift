//
//  Customer.swift
//  
//
//  Created by Hisop on 2023/11/17.
//

public struct Customer {
    private(set) var number: Int
    private(set) var business: Business
    
    init(number: Int) {
        self.number = number
        self.business = Business.allCases.randomElement() ?? .deposit
    }
}
