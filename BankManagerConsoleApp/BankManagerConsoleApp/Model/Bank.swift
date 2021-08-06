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
    typealias matchWithClerkAndClient = (client: Queue<Clientable>, clerk: Queue<Clerkable>)
    private var matchWithClerkAndClientByTaskType: [TaskType: matchWithClerkAndClient]
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
    
    init(NumberOfdepositClerk: Int, NumberOfloanClerk: Int) {
        let depositClientAndClerk = matchWithClerkAndClient(Queue<Clientable>(), Queue<Clerkable>())
        let loanClientAndClerk = matchWithClerkAndClient(Queue<Clientable>(), Queue<Clerkable>())
        self.matchWithClerkAndClientByTaskType = [.deposit: depositClientAndClerk, .loan:loanClientAndClerk]
        
        for _ in 0 ..< NumberOfdepositClerk {
            let clerk = BankClerk(bankType: .deposit)
            matchWithClerkAndClientByTaskType[.deposit]?.clerk.enqueue(clerk)
        }
        
        for _ in 0 ..< NumberOfloanClerk {
            let clerk = BankClerk(bankType: .loan)
            matchWithClerkAndClientByTaskType[.loan]?.clerk.enqueue(clerk)
        }
    }
    
    private func sotrClient() {
        while let client = bankClients.dequeue() {
            if client.bankType == .deposit {
                matchWithClerkAndClientByTaskType[.deposit]?.client.enqueue(client)
            } else {
                matchWithClerkAndClientByTaskType[.loan]?.client.enqueue(client)
            }
        }
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
    
    func serveClient(semaphere: DispatchSemaphore, client: Queue<Clientable>, clerk: Queue<Clerkable>, endServe: @escaping () -> Void ) {
        let group = DispatchGroup()
        while let currentClient = client.dequeue() {
            semaphere.wait()
            guard let currentClerk = clerk.dequeue() else {
                client.enqueue(currentClient)
                semaphere.signal()
                continue
            }
            group.enter()
            DispatchQueue.global().async {
                currentClerk.serveBanking(for: currentClient) { (endClerk) in
                    clerk.enqueue(currentClerk)
                    semaphere.signal()
                }
                endServe()
                group.leave()
            }
        }
        group.wait()
    }
    
    func prepareServe() {
        guard let deposit = matchWithClerkAndClientByTaskType[.deposit],
              let loan = matchWithClerkAndClientByTaskType[.loan] else {
            return
        }
        
        var totalNumberOfClients = 0
        let startTime = CFAbsoluteTimeGetCurrent()
        let depositSemaphore = DispatchSemaphore(value: deposit.clerk.count)
        let loanSemaphore = DispatchSemaphore(value: loan.clerk.count)
        let group = DispatchGroup()
        let globalQueue = DispatchQueue.global()
        
        group.enter()
        globalQueue.async { [self] in
            serveClient(semaphere: depositSemaphore, client: deposit.client, clerk: deposit.clerk) {
                totalNumberOfClients += 1
            }
            group.leave()
        }
        
        group.enter()
        globalQueue.async { [self] in
            serveClient(semaphere: loanSemaphore, client: loan.client, clerk: loan.clerk) {
                totalNumberOfClients += 1
            }
            group.leave()
        }
        
        group.wait()
        close(numberOfClients: totalNumberOfClients, workTime: CFAbsoluteTimeGetCurrent() - startTime)
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
            sotrClient()
            prepareServe()
            resetBank()
            return openBank()
        } else if bankMenu == BankMenu.close {
            return
        }
    }
}
