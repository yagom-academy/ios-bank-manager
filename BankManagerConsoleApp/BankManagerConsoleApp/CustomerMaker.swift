//
//  CustomerMaker.swift
//  BankManagerConsoleApp
//
//  Created by 이영우 on 2021/05/04.
//

import Foundation

final class CustomerMaker {
  func makeCustomer(count: Int) throws -> [Customer] {
    var customers: [Customer] = []
    for index in 1...count {
      try customers.append(randomCustomer(number: index))
    }
    return customers
  }
  
  func randomCustomer(number: Int) throws -> Customer {
    guard let grade = CustomerGrade.random() else {
      throw BankError.invalidNumberOfCustomers
    }
    
    guard let task = TaskType.random() else {
      throw BankError.invalidNumberOfCustomers
    }
    return Customer(order: number, grade: grade, taskType: task)
  }
}
