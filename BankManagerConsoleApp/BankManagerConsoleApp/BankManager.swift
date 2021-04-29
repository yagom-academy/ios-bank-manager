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

private func createClient(numberOfClient: Int ) -> [Int] {
    var clientArray : [Int] = []
    for waitingNumber in 1...numberOfClient {
        clientArray.append(waitingNumber)
    }
    return clientArray
}

private func handleClient(bankerArray: [Banker], clientArray: inout [Client]) {
    let operationQueue = OperationQueue()
    for clientIndex in 1...clientArray.count {
        operationQueue.addOperation(bankerArray[clientIndex])
        clientArray[clientIndex].BussinessProcessState = true
    }
}

private func manageBank() throws {
    let numberOfBank = 1
    while true {
        startBankMenu()
        guard let isValid = checkInputValidation() else { throw BankError.userInput }
        guard isValid else { return }
        
        // 클라이언트 큐 만들기
        // 클라이언트 큐에 고객 수 만큼 삽입하기
        var clientArray = createClient(numberOfClient: Int.random(in: 10...30))
        
        // bankerStateArray 만들기
        var bankerStateArray = [Bool](repeating: false, count: numberOfBank)
        
        // operation 큐 만들기
        let operationQueue = OperationQueue()
        
        // operation 큐에 banker 수 만큼 addOperation 하기
        for bankerIdentityNumber in 1...numberOfBank {
            if clientArray.count == 0 {break}
            let clientNumber = clientArray.removeFirst()
            operationQueue.addOperation(Banker(identityNumber: bankerIdentityNumber, counterNumber: bankerIdentityNumber, client: Client(BussinessProcessState: false, waitingNumber: clientNumber)))
            bankerStateArray[bankerIdentityNumber-1] = true
        }
        
        // bankerStateArray에 False가 있는지 확인하기 KVO
        
        // client 큐가 비어있지 않으면 pop해서 operation 큐에 addOperaion 하기
        if clientArray.count != 0 {
            let clientNumber = clientArray.removeFirst()
//            operationQueue.addOperation(Banker(identityNumber: bankerIdentityNumber, counterNumber: bankerIdentityNumber, client: Client(BussinessProcessState: false, waitingNumber: clientNumber)))
//            bankerStateArray[bankerIdentityNumber-1] = true
        }
        
        // bankerStateArray의 모든 원소가 false인지 확인하기 KVO
        
        let bank = Bank(numberOfWaitingClient: clientArray.count, totalNumberOfClinet: clientArray.count)
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



