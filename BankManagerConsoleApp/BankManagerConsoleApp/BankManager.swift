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

private func createClient() -> Int {
    let numberOfClient: Int = Int.random(in: 10...30)
    for clientNumber in 1...numberOfClient {
        Bank.clientQueue.append(Client(waitingNumber: clientNumber))
    }
    return numberOfClient
}

private func createBanker(numberOfBanker:Int) {
    for i in 1...numberOfBanker {
        let notification = NSNotification.Name.init("\(i)th Banker")
        let banker = Banker(bankerNumber: i ,client: nil, notification: notification)
        NotificationCenter.default.addObserver(banker, selector: #selector(Banker.finishWork(notification:)), name: notification, object: nil)
        Bank.operationQueue.addOperation(banker)
    }
}

private func manageBank() throws {
    let numberOfBanker: Int = 1
    while true {
        startBankMenu()
        guard let isValid = checkInputValidation() else { throw BankError.userInput }
        guard isValid else { return }
        let numberOfClient = createClient()
        createBanker(numberOfBanker: numberOfBanker)
        Bank.operationQueue.waitUntilAllOperationsAreFinished()
        let bank = Bank(totalNumberOfClinet: numberOfClient)
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



