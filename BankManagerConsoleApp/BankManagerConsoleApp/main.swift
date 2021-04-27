//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func startBankMenu() -> Bool{
    print("1. 은행 개점 \n2. 종료")
    print("입력 :", terminator: " " )
    guard let userInput = readLine() else { return false }
    guard let userInputNumber = Int(userInput) else { return false }
    return true
}

func checkInputValidation(userInputNumber: Int) {
    /// 입력 validation 체크
//    if userInputNumber == 2 { // userInputNumber 사용됨
//        return
//    } else if userInputNumber != 1 { // userInputNumber 사용됨
//        throw BankError.userInput
//    }
}

func createBanker(numberOfBanker: Int) -> [Banker] {
    var bankerArray : [Banker] = []
    for identityNumber in 1...numberOfBanker {
        bankerArray.append(Banker(identityNumber: identityNumber, counterNumber: identityNumber))
    }
    return bankerArray
}

func createClient(numberOfClinet: Int , bankerArray: [Banker]) -> [Client] {
    var clientArray : [Client] = []
    for waitingNumber in 1...numberOfClinet {
        let assignedBanker = bankerArray[ waitingNumber % bankerArray.count ] // numberOfBanker
        clientArray.append(Client(BussinessProcessState: false, waitingNumber: waitingNumber, assignedBankerNumber: assignedBanker.identityNumber))
    }
    return clientArray
}

func handleClient(clientArray: [Client]) {
    for client in clientArray { // clientArray
        print("\(client.waitingNumber)번 고객 업무 시작")
        Banker.handleClientBussiness()
        print("\(client.waitingNumber)번 고객 업무 종료")
    }
}

func startBank() throws {
    while true {
        var isValid = startBankMenu()
        
        let bankerArray = createBanker(numberOfBanker: 1)
        let clientArray = createClient(numberOfClinet: Int.random(in: 10...30), bankerArray: bankerArray)
        handleClient(clientArray: clientArray)
        
        let bank = Bank(numberOfBanker: bankerArray.count, numberOfWaitingClient: clientArray.count, totalNumberOfClinet: clientArray.count)
        bank.closeBusiness()
    }
}







do {
    try startBank()
} catch {
    print(error.localizedDescription)
}
