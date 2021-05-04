//
//  CustomerMaker.swift
//  BankManagerConsoleApp
//
//  Created by 이영우 on 2021/05/04.
//

import Foundation

final class CustomerMaker {
  func makeCustomer(count: Int) -> [Customer] {
    var customers: [Customer] = []
    for index in 1...count {
      customers.append(randomCustomer(number: index))
    }
    return customers
  }
  
  func randomCustomer(number: Int) -> Customer {
    guard let grade = CustomerGrade(rawValue: Int.random(in: 0...2)) else {
      return Customer(order: number, grade: .normal, taskType: .deposit)
    }
    
    guard let task = TaskType(rawValue: Int.random(in: 0...1)) else {
      return Customer(order: number, grade: .normal, taskType: .deposit)
    }
    return Customer(order: number, grade: grade, taskType: task)
  }
}
