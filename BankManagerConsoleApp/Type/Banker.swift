//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by ysp on 2021/04/27.
//

import Foundation

class Banker: Operation {
    let identityNumber: Int
    let counterNumber: Int
    let client: Client

    init(identityNumber: Int, counterNumber: Int, client: Client) {
        self.identityNumber = identityNumber
        self.counterNumber = counterNumber
        self.client = client
    }

    override func main() {
        handleClientBussiness(waitingNumberOfClient: client.waitingNumber)
    }

    func handleClientBussiness(waitingNumberOfClient: Int) {
        print("\(waitingNumberOfClient)번 고객 업무 시작")
        Bank.totalBusinessTime += 0.7
        Bank.totalBusinessTime = round( Bank.totalBusinessTime * 100 ) / 100
        print("\(waitingNumberOfClient)번 고객 업무 완료")
    }
}
