//
//  HeadQuarter.swift
//  BankManagerConsoleApp
//
//  Created by 이영우 on 2021/05/06.
//

import Foundation

class HeadQuarter {
  static let headQuarter: HeadQuarter = HeadQuarter()
  private var operationQueue = OperationQueue()
  
  private init() { }
  
  func processTask(number: Int, grade: CustomerGrade, completion: @escaping ()->Void = { }) {
    operationQueue.maxConcurrentOperationCount = 1
    let task = HeadQuarterTask(number: number, grade: grade)
    task.completionBlock = completion
    operationQueue.addOperations( [task] , waitUntilFinished: true)
  }
}
