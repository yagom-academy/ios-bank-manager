//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Kyungmin Lee on 2021/01/15.
//

import Foundation

class BankClerk {
    // MARK: - Properties
    var bankWindowNumber: Int
    var isWorking: Bool {
        currentClient != nil
    }
    var currentClient: Client?
    var finishedClients: Int = 0
    let taskQueue: DispatchQueue
    
    // MARK: - Methods
    func startWork(for client: Client) {
        currentClient = client
        print("\(client.tag)번 \(client.priority.string)고객 \(client.bankBusiness.string)업무 시작")
        taskQueue.async {
            Thread.sleep(forTimeInterval: self.taskTime(bankBusiness: client.bankBusiness))
            self.finishWork()
        }
    }
    
    func finishWork() {
        finishedClients += 1
        if let client = currentClient {
            print("\(client.tag)번 \(client.priority.string)고객 \(client.bankBusiness.string)업무 완료")
        }
        currentClient = nil
    }
    
    func taskTime(bankBusiness: BankBusiness) -> TimeInterval {
        switch bankBusiness {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
    
    init(bankWindow number: Int) {
        bankWindowNumber = number
        taskQueue = DispatchQueue(label: "\(number)번 창구")
    }
}
