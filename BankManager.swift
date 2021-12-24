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
    while true {
      let choiceMenu = self.chooseMenu()
      
      switch choiceMenu {
      case Menu.openBank.rawValue :
        operateBank(numberOfBankers: numberOfBankers)
      case Menu.exit.rawValue :
        return
      default :
        print("잘못된 입력입니다. 확인해주세요.")
      }
    }
    
  }
  
  private mutating func operateBank (numberOfBankers: Int) {
    let bankers = prepareBanker(numberOfBankers: numberOfBankers)
    var bank: Bank = Bank(bankers: bankers, operatingTimeManager: OperatingTimeManager())
    bank.doBanking()
  }
  
  private mutating func prepareBanker(numberOfBankers: Int) -> [Banker] {
    var bankers: [Banker] = []

    (0..<numberOfBankers).forEach {_ in
      let banker = Banker()
      bankers.append(banker)
    }
    return bankers
  }
}
                              
