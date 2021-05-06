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
  
  func processTask(number: Int, grade: CustomerGrade) {
      operationQueue.maxConcurrentOperationCount = 1
      operationQueue.addOperations( [HeadQuarterTask(number: number, grade: grade)] , waitUntilFinished: true)
  }
}
