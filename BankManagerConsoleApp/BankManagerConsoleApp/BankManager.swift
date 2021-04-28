//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by 최정민 on 2021/04/27.
//

import Foundation

private func startBankMenu() {
    print("1 : 은행 개점 \n2 : 종료")
    print("입력 :", terminator: " " )
}

private func checkInputValidation() -> Bool? {
    guard let userInput = readLine() else { return nil }
    guard let userInputNumber = Int(userInput) else { return nil }
    if userInputNumber == 1 {
        return true
    } else if userInputNumber == 2 {
        return false
    }
    return nil
}

private func createBanker(numberOfBanker: Int) -> [Banker] {
    var bankerArray : [Banker] = []
    for identityNumber in 1...numberOfBanker {
        bankerArray.append(Banker(identityNumber: identityNumber, counterNumber: identityNumber))
    }
    return bankerArray
}

private func createClient(numberOfClient: Int , bankerArray: [Banker]) -> [Client] {
    var clientArray : [Client] = []
    for waitingNumber in 1...numberOfClient {
        let assignedBanker = bankerArray[ waitingNumber % bankerArray.count ]
        clientArray.append(Client(BussinessProcessState: false, waitingNumber: waitingNumber, assignedBankerNumber: assignedBanker.identityNumber))
    }
    return clientArray
}

private func handleClient(clientArray: inout [Client]) {
    for clientIndex in 0...clientArray.count-1 {
        print("\(clientArray[clientIndex].waitingNumber)번 고객 업무 시작")
        Banker.handleClientBussiness()
        clientArray[clientIndex].BussinessProcessState = true
        print("\(clientArray[clientIndex].waitingNumber)번 고객 업무 완료")
    }
}

private func manageBank() throws {
    while true {
        startBankMenu()
        guard let isValid = checkInputValidation() else { throw BankError.userInput }
        guard isValid else { return }
        let bankerArray = createBanker(numberOfBanker: 1)
        var clientArray = createClient(numberOfClient: Int.random(in: 10...30), bankerArray: bankerArray)
        handleClient(clientArray: &clientArray)
        let bank = Bank(numberOfBanker: bankerArray.count, numberOfWaitingClient: clientArray.count, totalNumberOfClinet: clientArray.count)
        bank.closeBusiness()
    }
}

public func startBank() {
    do {
        try manageBank()
    } catch {
        print(error.localizedDescription)
    }
}
