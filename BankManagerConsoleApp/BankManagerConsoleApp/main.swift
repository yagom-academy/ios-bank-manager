//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func startBank() throws {
    while true {
        print("1. 은행 개점 \n2. 종료")
        print("입력 :", terminator: " " )
        guard let userInput = readLine() else { throw BankError.userInput }
        guard let userInputNumber = Int(userInput) else { return }
        
        if userInputNumber == 2 {
            return
        } else if userInputNumber != 1 {
            throw BankError.userInput
        }
        
        let numberOfClinet = Int.random(in: 10...30)
        var clientArray : [Client] = []
        let numberOfBanker = 1
        var bankerArray : [Banker] = []
        let bank = Bank(numberOfBanker: numberOfBanker, numberOfWaitingClient: numberOfClinet, totalNumberOfClinet: numberOfClinet)
        
        for identityNumber in 1...numberOfBanker {
            bankerArray.append(Banker(identityNumber: identityNumber, counterNumber: identityNumber))
        }
        
        for waitingNumber in 1...numberOfClinet {
            let assignedBanker = bankerArray[ waitingNumber % numberOfBanker ]
            clientArray.append(Client(BussinessProcessState: false, waitingNumber: waitingNumber, assignedBankerNumber: assignedBanker.identityNumber))
        }
        
        for client in clientArray {
            print("\(client.waitingNumber)번 고객 업무 시작")
            Banker.handleClientBussiness()
            print("\(client.waitingNumber)번 고객 업무 종료")
        }
        
        bank.closeBusiness()
    }
}


do {
    try startBank()
} catch {
    print(error.localizedDescription)
}
