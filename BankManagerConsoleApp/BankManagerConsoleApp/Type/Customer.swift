//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/26.
//

import Foundation

final class Customer {
  private let ticketNumber: Int
  private var grade: CustomerGrade
  private let taskType: TaskType
  private var task: BankTask {
    return BankTask(number: ticketNumber, grade: grade, type: taskType)
  }

  init(order orderNumber: Int, grade: CustomerGrade, taskType: TaskType) {
    self.ticketNumber = orderNumber
    self.grade = grade
    self.taskType = taskType
  }

  func showTask() -> BankTask {
    return task
  }
  
  func showCustomerProperty() -> (Int, CustomerGrade, TaskType) {
    return (ticketNumber, grade, taskType)
  }
}
