//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by tae hoon park on 2021/07/29.
//

import Foundation



enum BankMenu: String {
    case open = "1"
    case close = "2"
}

class Bank {
    
    private enum NumberOfClient {
        static let maximumNumber = 30
        static let minimunNumber = 10
    }
    
    private var taskByTaskType: [TaskType: Task] = [:]
    private let numberOfClerk = (deposit: 2, loan: 1)
    private lazy var bankClients = generateNewClients()
    private let generateNewClients = { () -> Queue<Clientable> in
        let newClients = Queue<Clientable>()
        let totalNumberOfClients = Int.random(in: NumberOfClient.minimunNumber...NumberOfClient.maximumNumber)
        for waitingNumber in 1...totalNumberOfClients {
            let client = BankClient(waitingNumber: waitingNumber)
            newClients.enqueue(client)
        }
        return newClients
    }
    
    private func resetBank() {
        bankClients = generateNewClients()
    }
    
    private func printMenu() {
        print("1: 은행개점")
        print("2: 종료")
    }
    
    private func generateBankMenuNumber() -> BankMenu? {
        print("입력 : ", terminator: "")
        guard let inputNumber = readLine() else {
            return nil
        }
        if let menuNumber = BankMenu(rawValue: inputNumber) {
            switch menuNumber {
            case .open:
                return BankMenu.open
            case .close:
                return BankMenu.close
            }
        } else {
            print("잘못된 입력입니다. 다시 입력해주세요.")
            return generateBankMenuNumber()
        }
    }
    
    func serveClient() {
        var totalNumberOfClients = 0
        let startTime = CFAbsoluteTimeGetCurrent()
        let group = DispatchGroup()
        while let currentClient = bankClients.dequeue() {
            group.enter()
            taskByTaskType[currentClient.bankType]?.dispatchQueue.async { [self] in
                taskByTaskType[currentClient.bankType]?.semaphore.wait()
                let currentClerk = BankClerk(bankType: currentClient.bankType)
                currentClerk.serveBanking(for: currentClient)
                taskByTaskType[currentClient.bankType]?.semaphore.signal()
                group.leave()
                totalNumberOfClients += 1
            }
        }
        group.wait()
        close(numberOfClients: totalNumberOfClients, workTime: CFAbsoluteTimeGetCurrent() - startTime)
    }
    
    func generateBankTypeTask() {
        let depositSemaphore = DispatchSemaphore(value: numberOfClerk.deposit)
        let loanSemaphore = DispatchSemaphore(value: numberOfClerk.loan)
        let depositTask = Task(semaphore: depositSemaphore)
        let loanTask = Task(semaphore: loanSemaphore)
        taskByTaskType = [.deposit: depositTask, .loan: loanTask]
    }
    
    func close(numberOfClients: Int, workTime: Double) {
        let convertWorkTime = String(format: "%.2f", workTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClients)명이며, 총 업무 시간은 \(convertWorkTime)초입니다.")
    }
    
    func openBank() {
        printMenu()
        guard let bankMenu = generateBankMenuNumber() else {
            return
        }
        if bankMenu == BankMenu.open {
            generateBankTypeTask()
            serveClient()
            resetBank()
            return openBank()
        } else if bankMenu == BankMenu.close {
            return
        }
    }
}
