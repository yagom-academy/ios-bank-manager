//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
  private func chooseMenu() -> String {
    print("""
          1 : 은행 개점
          2 : 종료
          입력 :
          """, terminator: "")
    
    guard let input = readLine() else {
      return ""
    }
    return input
  }
  
  mutating func runBankManager() {
    var isExit: Bool = false

    while isExit == false {
      let choiceMenu = self.chooseMenu()
      
      switch choiceMenu {
      case "1" :
        var bank = Bank()
        bank.doBanking()
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(bank.numberOfClients)명이며,"
              + "총 업무시간은 \(bank.workingTime())초입니다.")
      case "2" :
        isExit = true
      default :
        print("잘못된 입력입니다. 확인해주세요.")
      }
    }
  }
}
