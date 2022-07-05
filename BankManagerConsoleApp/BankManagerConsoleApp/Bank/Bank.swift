//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/06/30.
//

struct Bank {
    private(set) var waitingClient: Int
    private(set) var numberOfDepositBanker: Int
    private(set) var numberOfLoanBanker: Int
    var clientQueue: ClientQueue<Client>?
    
    init(waitingClient: Int, numberOfDepositBanker: Int, numberOfLoanBanker: Int) {
        self.waitingClient = waitingClient
        self.numberOfDepositBanker = numberOfDepositBanker
        self.numberOfLoanBanker = numberOfLoanBanker
    }
}
