//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/26.
//

import Foundation

class Customer {
  private let ticketNumber: Int
  private var grade: CustomerGrade
  private let taskType: TaskType
  var task: BankTask {
    get {
      return BankTask(number: ticketNumber, grade: grade, type: taskType)
    }
  }

  init(order orderNumber: Int, grade: CustomerGrade, taskType: TaskType) {
    self.ticketNumber = orderNumber
    self.grade = grade
    self.taskType = taskType
  }
}
