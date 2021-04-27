//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func startBank() throws {
    while true {
        /// 입력 기능
        print("1. 은행 개점 \n2. 종료")
        print("입력 :", terminator: " " )
        guard let userInput = readLine() else { throw BankError.userInput }
        guard let userInputNumber = Int(userInput) else { return }
        
        
        /// 입력 validation 체크
        if userInputNumber == 2 { // userInputNumber 사용됨
            return
        } else if userInputNumber != 1 { // userInputNumber 사용됨
            throw BankError.userInput
        }
        
        
        /// Banker 생성
        let numberOfBanker = 1
        var bankerArray : [Banker] = []
        for identityNumber in 1...numberOfBanker {
            bankerArray.append(Banker(identityNumber: identityNumber, counterNumber: identityNumber))
        }
    
        /// Client 생성
        let numberOfClinet = Int.random(in: 10...30)
        var clientArray : [Client] = []
        for waitingNumber in 1...numberOfClinet {
            let assignedBanker = bankerArray[ waitingNumber % numberOfBanker ] // numberOfBanker
            clientArray.append(Client(BussinessProcessState: false, waitingNumber: waitingNumber, assignedBankerNumber: assignedBanker.identityNumber))
        }
        
        /// 고객 업무 처리 기능
        for client in clientArray { // clientArray
            print("\(client.waitingNumber)번 고객 업무 시작")
            Banker.handleClientBussiness()
            print("\(client.waitingNumber)번 고객 업무 종료")
        }
        
        
        ///
        let bank = Bank(numberOfBanker: numberOfBanker, numberOfWaitingClient: numberOfClinet, totalNumberOfClinet: numberOfClinet)
        bank.closeBusiness()
    }
}







do {
    try startBank()
} catch {
    print(error.localizedDescription)
}
