//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Kyungmin Lee on 2021/01/15.
//

import Foundation

class BankClerk {
    // MARK: - Constants
    enum TaskTime {
        static let executeDeposit: TimeInterval = 0.7
        static let reviewLoanDocument: TimeInterval = 0.3
        static let executeLoan: TimeInterval = 0.3
    }

    // MARK: - Properties
    private let bankHeadOffice: BankHeadOffice
    private(set) var bankWindowNumber: Int
    var isWorking: Bool {
        currentClient != nil
    }
    private(set) var currentClient: Client?
    private(set) var finishedClients: Int = 0
    private let taskQueue: DispatchQueue
    
    // MARK: - Methods
    init(bankHeadOffice: BankHeadOffice, bankWindowNumber: Int) {
        self.bankHeadOffice = bankHeadOffice
        self.bankWindowNumber = bankWindowNumber
        taskQueue = DispatchQueue(label: "\(bankWindowNumber)번 창구")
    }
    
    func startWork(for client: Client) {
        currentClient = client
        print("\(client.tag)번 \(client.priority.string)고객 \(client.bankBusiness.string)업무 시작")
        
        switch client.bankBusiness {
        case .deposit:
            executeDeposit()
        case .loan:
            reviewLoanDocument()
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
            self.requestLoan()
        }
    }

    private func requestLoan() {
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveLoanApproval(_:)), name: NSNotification.Name("requestLoan#\(bankWindowNumber)"), object: nil)
        bankHeadOffice.addJudgementLoan(self)
    }
    
    @objc private func didReceiveLoanApproval(_ notification: Notification) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("requestLoan#\(bankWindowNumber)"), object: nil)
        executeLoan()
    }

    private func executeLoan() {
        taskQueue.async {
            Thread.sleep(forTimeInterval: TaskTime.executeLoan)
            self.finishWork()
        }
    }
}
