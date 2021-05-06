//
//  HeadQuarterTask.swift
//  BankManagerConsoleApp
//
//  Created by 이영우 on 2021/05/06.
//

import Foundation

class HeadQuarterTask: Operation {
  let number: Int
  let grade: CustomerGrade
  
  init(number: Int, grade: CustomerGrade) {
    self.number = number
    self.grade = grade
  }
  
  override func main() {
    print("\(number)번 \(grade)고객 대출심사 시작")
    Thread.sleep(forTimeInterval: 0.5)
    print("\(number)번 \(grade)고객 대출심사 완료")
  }
}
