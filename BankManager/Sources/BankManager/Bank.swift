//
//  File.swift
//  
//
//  Created by Hisop on 2023/11/17.
//

public struct Bank {
    private var name: String
    private var employeesCount: Int
    private let customerQueue = CustomerQueue<Customer>()
    
    init(name: String, employeesCount: Int) {
        self.name = name
        self.employeesCount = employeesCount
    }
}

