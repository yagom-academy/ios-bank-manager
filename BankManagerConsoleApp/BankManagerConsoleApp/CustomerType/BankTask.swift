//
//  BankTask.swift
//  BankManagerConsoleApp
//
//  Created by 이영우 on 2021/05/04.
//

import Foundation

final class BankTask: Operation {
  private var grade: CustomerGrade
  private var number: Int
  private var type: TaskType
  private let headQuarter: HeadQuarter = HeadQuarter.headQuarter
  
  init(number: Int, grade: CustomerGrade, type: TaskType) {
    self.grade = grade
    self.number = number
    self.type = type
    super.init()
    super.queuePriority = grade.queuePriority
  }
  
  override func main() {
    let workingTime: Double = self.type.taskTime
    print("\(number)번 \(grade)고객 \(type)업무 시작")
    Thread.sleep(forTimeInterval: workingTime)
    if type == .loan {
      headQuarter.processTask(number: number, grade: grade)
      Thread.sleep(forTimeInterval: workingTime)
    }
    print("\(number)번 \(grade)고객 \(type)업무 완료")
  }
}
