//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let testBank = Bank(numOfManagers: 1)
var isRepeat = true

repeat {
  print("1: 은행 개점")
  print("2: 종료")
  guard let userChoice = Int(readLine() ?? "0") else {
    print("올바른 값을 입력해주세요.")
    continue
  }

  switch userChoice {
  case 1:
    testBank.open()
  case 2:
    isRepeat = false
    break
  default:
    break
  }
} while isRepeat
