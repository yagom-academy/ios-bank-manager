//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Yongwoo Marco on 2021/08/02.
//

import Foundation

enum BankingTask: CaseIterable {
    case deposit
    case loan
    
    static func selectRandomCase() -> BankingTask {
        guard let element = BankingTask.allCases.randomElement() else { fatalError("원하는 업무가 없음.")}
        return element
    }
    
    var numberOfBankWindow: Int {
        switch self {
        case .deposit:
            return 2
        case .loan:
            return 1
        }
    }
    
    var processingTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}


final class BankManager {
    private var clientQueue: Queue<Client>
    private var departments: Dictionary<BankingTask, Department>
    private var clientCount: Int
    private var totalTime: Double
    
    init() {
        self.clientQueue = .init()
        self.departments = .init()
        for task in BankingTask.allCases {
            departments.updateValue(Department(bankingTask: task), forKey: task)
        }
        self.clientCount = 0
        self.totalTime = 0
    }
    
    func lineupClients(_ numberOfClients: Int = Int.random(in: 10...30)) {
        for number in 1...numberOfClients {
            clientQueue.enqueue(Client(waitingNumber: number, bankingTask: BankingTask.selectRandomCase()))
        }
    }
    
    func open() {
        let servingGroup = DispatchGroup()
        while let client = clientQueue.dequeue() {
            let bankingTask = client.bankingTask
            guard departments[bankingTask] != nil else { fatalError() }
            departments[bankingTask]?.dispatchQueue.async(group: servingGroup) { [self] in
                departments[bankingTask]?.dispatchSemaphore.wait()
                defer { departments[bankingTask]?.dispatchSemaphore.signal() }
                
                let bankTeller = departments[bankingTask]!.assignBankTeller()!
                bankTeller.serve(client) {
                    clientCount += 1
                }
                departments[bankingTask]?.setup(bankTeller)
            }
        }
        servingGroup.wait()
    }
    
    func close() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, 총 업무시간은 \(String(format: "%.2f", totalTime))초입니다.")
        self.clientCount = 0
        self.totalTime = 0
    }
}
