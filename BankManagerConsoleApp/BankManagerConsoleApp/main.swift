//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var isRepeat = true
repeat {
  print("1: 은행 개점")
  print("2: 종료")
  print("입력 : ", terminator: "")
  guard let selectedNumber = Int(readLine() ?? "0"),
            selectedNumber == 1 || selectedNumber == 2 else {
    print("올바른 값을 입력해주세요.")
    continue
  }

  switch selectedNumber {
  case 1:
    Bank().open()
  case 2:
    isRepeat = false
    break
  default:
    break
  }
} while isRepeat
