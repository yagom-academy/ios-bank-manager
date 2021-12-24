//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
  enum Menu: String {
    case openBank = "1"
    case exit = "2"
  }
  
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
  
  mutating func runBankManager(numberOfBankers: Int) {
    var isExit: Bool = false
    
    while isExit == false {
      let choiceMenu = self.chooseMenu()
      
      switch choiceMenu {
      case Menu.openBank.rawValue :
        let bankers = prepareBanker(numberOfBankers: numberOfBankers)
        var bank: Bank = Bank(bankers: bankers)
        bank.doBanking()
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(bank.numberOfClients)명이며,"
              + "총 업무시간은 \(bank.workingTime())초입니다.")
      case Menu.exit.rawValue :
        isExit = true
      default :
        print("잘못된 입력입니다. 확인해주세요.")
      }
    }
  }
  
  mutating func prepareBanker(numberOfBankers: Int) -> [Banker] {
    var bankers: [Banker] = []

    (0..<numberOfBankers).forEach {_ in
      let banker = Banker()
      bankers.append(banker)
    }
    return bankers
  }
}
                              
