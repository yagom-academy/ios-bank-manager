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
  
  mutating func runBankManager(numberOfDepositBankers: Int, numberOfLoanBankers: Int) {
    while true {
      let choiceMenu = self.chooseMenu()
      
      switch choiceMenu {
      case Menu.openBank.rawValue :
        operateBank(numberOfDepositBankers: numberOfDepositBankers,
                    numberOfLoanBankers: numberOfLoanBankers)
      case Menu.exit.rawValue :
        return
      default :
        print("잘못된 입력입니다. 확인해주세요.")
      }
    }
  }
  
  private mutating func operateBank (numberOfDepositBankers: Int, numberOfLoanBankers: Int) {
    let numberOfClients = Int.random(in: 10...30)
    let bankers = prepareBanker(numberOfDepositBankers: numberOfDepositBankers,
                                numberOfLoanBankers: numberOfLoanBankers)
    let clients = clientLineUp(numberOfClients: numberOfClients)
    let bank = Bank(numberOfClients: numberOfClients, bankers: bankers, clientQueue: clients,  operatingTimeManager: OperatingTimeManager())
    bank.doBanking()
  }
  
  private mutating func prepareBanker(numberOfDepositBankers: Int,
                                      numberOfLoanBankers: Int) -> [Banker] {
    let depositeBankers = Array.init(repeating: Banker(assignedTask: .deposit),
                                     count: numberOfDepositBankers)
    let loanBankers = Array.init(repeating: Banker(assignedTask: .loan),
                                 count: numberOfLoanBankers)
    return depositeBankers + loanBankers
  }
  
  private func clientLineUp(numberOfClients: Int) -> Queue<Client> {
    let numberOfClients = numberOfClients
    var clientQueue = Queue<Client>()
    for sequence in 0..<numberOfClients {
      clientQueue.enqueue(Client(sequence: sequence))
    }
    return clientQueue
  }
}
                              
