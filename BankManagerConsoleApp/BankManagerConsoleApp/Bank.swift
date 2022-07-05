//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/06/30.
//

import Foundation

struct Bank {
    private var servedClient: Int
    private var waitingClient: Int?
    private var clientQueue: ClientQueue<Client>?
    private var numberOfDepositBanker: Int
    private var numberOfLoanBanker: Int
    
    init(numberOfDepositBanker: Int, numberOfLoanBanker: Int) {
        self.numberOfDepositBanker = numberOfDepositBanker
        self.numberOfLoanBanker = numberOfLoanBanker
        self.servedClient = 0
    }

    mutating func run() {
        showMenu()
        chooseOption()
    }
    
    private func calculateTotalTime(bankTaskFunction: () -> ()) -> CFAbsoluteTime {
        let startTime = CFAbsoluteTimeGetCurrent()
        bankTaskFunction()
        let totalTime = CFAbsoluteTimeGetCurrent() - startTime

        return totalTime
    }
    
    private func showMenu() {
        print("1 : 은행개점\n2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    private mutating func chooseOption() {
        guard let option = readLine() else {
            return
        }
        
        switch option {
        case Option.open:
            openBank()
        case Option.close:
            break
        default:
            requestReInput()
        }
    }
    
    private mutating func requestReInput() {
        print("잘못된 입력 입니다. 다시 입력해주세요")
        run()
    }
    
    private mutating func openBank() {
        reset()
        let bankingHour = runBusiness()
        terminateBusiness(bankingHour)
        run()
    }

    private mutating func reset() {
        servedClient = .zero
        waitingClient = Int.random(in: 10...30)
        clientQueue = makeClientQueue()
    }
    
    private mutating func runBusiness() -> CFAbsoluteTime {
        guard var queue = clientQueue else {
            return .nan
        }
        
        let depositBanker = DepositBankManager()
        let loanBanker = LoanBankManager()

        let bankGroup = DispatchGroup()
        let depositQueue = DispatchQueue(label: Option.deposit, attributes: .concurrent)
        let loanQueue = DispatchQueue(label: Option.loan, attributes: .concurrent)
        let depositSemaphore = DispatchSemaphore(value: numberOfDepositBanker)
        let loanSemaphore = DispatchSemaphore(value: numberOfLoanBanker)

        let caculTime = calculateTotalTime {
            while queue.isEmpty == false {
                guard let client = queue.dequeue() else {
                    return
                }
                
                if client.desiredServices == Option.deposit {
                    depositQueue.async(group: bankGroup) {
                        depositSemaphore.wait()
                        depositBanker.work(from: client)
                        depositSemaphore.signal()
                    }
                } else if client.desiredServices == Option.loan {
                    loanQueue.async(group: bankGroup) {
                        loanSemaphore.wait()
                        loanBanker.work(from: client)
                        loanSemaphore.signal()
                    }
                }
                servedClient += 1
            }
            bankGroup.wait()
        }
        return caculTime
    }

    private mutating func terminateBusiness(_ businessHour: CFAbsoluteTime) {
        print("""
        업무가 마감되었습니다. \
        오늘 업무를 처리한 고객은 총 \(servedClient)명이며, \
        총 업무시간은 \(String(format: "%.2f", businessHour))초입니다.
        """)
    }
    
    private mutating func makeClientQueue() -> ClientQueue<Client>? {
        var clientQueue = ClientQueue<Client>()
        let task = [Option.deposit, Option.loan]
        
        guard let waitingClient = waitingClient else {
            return nil
        }
        
        for waitingNumber in 1...waitingClient {
            guard let taskRandomElement = task.randomElement() else {
                return nil
            }
            let client = Client(waitingNumber: waitingNumber, desiredServices: taskRandomElement)
            clientQueue.enqueue(client)
        }
        return clientQueue
    }
}
