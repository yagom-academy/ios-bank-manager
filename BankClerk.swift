//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Kyungmin Lee on 2021/01/15.
//

import Foundation

class BankClerk {
    // MARK: - Constants
    struct TaskTime {
        static let executeDeposit: TimeInterval = 0.7
        static let reviewLoanDocument: TimeInterval = 0.3
        static let executeLoan: TimeInterval = 0.3
    }

    
    // MARK: - Properties
    private(set) var bankWindowNumber: Int
    var isWorking: Bool {
        currentClient != nil
    }
    private var currentClient: Client?
    private(set) var finishedClients: Int = 0
    private let taskQueue: DispatchQueue
    
    // MARK: - Methods
    init(bankWindow number: Int) {
        bankWindowNumber = number
        taskQueue = DispatchQueue(label: "\(number)번 창구")
    }
    
    func startWork(for client: Client) {
        currentClient = client
        print("\(client.tag)번 \(client.priority.string)고객 \(client.bankBusiness.string)업무 시작")
        
        switch client.bankBusiness {
        case .deposit:
            executeDeposit()
            break
        case .loan:
            reviewLoanDocument()
            break
        }
    }
    
    private func finishWork() {
        finishedClients += 1
        if let client = currentClient {
            print("\(client.tag)번 \(client.priority.string)고객 \(client.bankBusiness.string)업무 완료")
        }
        currentClient = nil
    }
    
    private func executeDeposit() {
        taskQueue.async {
            Thread.sleep(forTimeInterval: TaskTime.executeDeposit)
            self.finishWork()
        }
    }

    private func reviewLoanDocument() {
        taskQueue.async {
            Thread.sleep(forTimeInterval: TaskTime.reviewLoanDocument)
            self.executeLoan()
        }
    }

    private func requestLoan() {
        //bankHeadOffice.addJudgementLoan(self)
    }

    func executeLoan() {
        taskQueue.async {
            Thread.sleep(forTimeInterval: TaskTime.executeLoan)
            self.finishWork()
        }
    }
}
