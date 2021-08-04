//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by tae hoon park on 2021/07/29.
//

import Foundation

protocol Clerk {
    var bankType: BankType { set get }
    func serveBanking(for client: BankClient, notifyEnd: @escaping (BankClerk) -> Void )
}

protocol Client {
    var bankType: BankType { set get }
    var waitingNumber: Int { get }
}

enum BankType: String, CaseIterable {
    case deposit = "예금"
    case loan = "대출"
    
    var workingTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    static var random: BankType {
        guard let random = BankType.allCases.randomElement() else {
            return .deposit
        }
        return random
    }
}

enum BankMenu: String {
    case open = "1"
    case close = "2"
}

class Bank {
    private var bankTypeTask: [BankType: Task] = [:]
    
    private lazy var bankClients = generateNewClients()
    private var totalWorkTime: Double = 0
    private let generateNewClients = { () -> Queue<BankClient> in
        let newClients = Queue<BankClient>()
        let totalNumberOfClients = Int.random(in: 10...30)
        for waittingNumber in 1...totalNumberOfClients {
            let client = BankClient(waitingNumber: waittingNumber)
            newClients.enqueue(client)
        }
        return newClients
    }
    
    //    init(deposit: Int = 2, loan: Int = 1) {
    //        for _ in 0 ..< deposit {
    //            let depositClerk = BankClerk(bankType: .deposit)
    //            bankClerk.append(depositClerk)
    //        }
    //
    //        for _ in 0 ..< loan {
    //            let loanClerk = BankClerk(bankType: .loan)
    //            bankClerk.append(loanClerk)
    //        }
    //    }
    
    private func resetBank() {
        totalWorkTime = 0
        bankClients = generateNewClients()
    }
    
    private func printMenu() {
        print("1: 은행개점")
        print("2: 종료")
    }
    
    private func generateInputUserMenuNumber() -> BankMenu? {
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
            return generateInputUserMenuNumber()
        }
    }
    
    func serveClient() {
        let group = DispatchGroup()
        while let currentClient = bankClients.dequeue() {
            group.enter()
            bankTypeTask[currentClient.bankType]?.dispatchQueue.async { [self] in
                bankTypeTask[currentClient.bankType]?.semaphore.wait()
                let currentClerk = BankClerk(bankType: currentClient.bankType)
                currentClerk.serveBanking(for: currentClient) { endClerk in
                    
                }
                bankTypeTask[currentClient.bankType]?.semaphore.signal()
                group.leave()
            }
        }
        group.wait()
    }
    
    func generateBankTypeTask() {
        let depositSemaphore = DispatchSemaphore(value: 2)
        let loanSemaphore = DispatchSemaphore(value: 1)
        let depositTask = Task(semaphore: depositSemaphore)
        let loanTask = Task(semaphore: loanSemaphore)
        bankTypeTask = [.deposit: depositTask, .loan: loanTask]
    }
    
    //    func close(numberOfClients: Int, workTime: Double) {
    //        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClients)명이며, 총 업무 시간은 \(convertedWorkTime)입니다.")
    //    }
    
    func openBank() {
        printMenu()
        guard let userInput = generateInputUserMenuNumber() else {
            return
        }
        if userInput == BankMenu.open {
            generateBankTypeTask()
            serveClient()
            resetBank()
            return openBank()
        } else if userInput == BankMenu.close {
            return
        }
    }
}
