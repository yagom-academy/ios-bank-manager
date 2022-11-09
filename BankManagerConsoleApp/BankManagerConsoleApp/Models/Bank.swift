//  Created by stone, 애종 on 2022/11/02.

import Foundation

struct Bank {
    private var manager: Workable
    private var customerList: Queue<Customer>
    private var numberOfCustomer: Int
    private var totalWorkTime: Double
    private let group: DispatchGroup
    private let semaphore: DispatchSemaphore
    private let loanQueue: DispatchQueue
    
    init(manager: Workable, customerList: Queue<Customer>) {
        self.manager = manager
        self.customerList = customerList
        self.numberOfCustomer = 0
        self.totalWorkTime = 0
        self.group = DispatchGroup()
        self.semaphore = DispatchSemaphore(value: 2)
        self.loanQueue = DispatchQueue(label: WorkType.loan.rawValue)
    }
    
    mutating func startConsoleApp() {
        print("""
            1 : 은행 개점
            2 : 종료
            입력 :
            """, terminator: " ")
        
        handleBankSystem(userInput: fetchUserInput())
    }
    
    private func fetchUserInput() -> String? {
        return readLine()
    }
    
    mutating private func handleBankSystem(userInput: String?) {
        switch userInput {
        case Namespace.openBank:
            let startTime = CFAbsoluteTimeGetCurrent()
            openBank()
            self.group.wait()
            self.totalWorkTime = CFAbsoluteTimeGetCurrent() - startTime
            endWork()
        case Namespace.closeBank:
            return
        default:
            break
        }
        startConsoleApp()
    }
    
    mutating private func openBank() {
        self.numberOfCustomer = Int.random(in: 10...30)
        registerCustomers(with: self.numberOfCustomer)
        
        startWork()
    }
    
    mutating private func startWork() {
        while !self.customerList.isEmpty {
            let customer = self.customerList.dequeue()
            
            switch customer?.purpose {
            case .deposit:
                DispatchQueue.global().async(group: group) { [self] in
                    semaphore.wait()
                    self.manager.provideService(to: customer)
                    semaphore.signal()
                }
            case .loan:
                loanQueue.async(group: group) { [self] in
                    self.manager.provideService(to: customer)
                }
            default:
                break
            }
        }
    }
    
    mutating private func registerCustomers(with numberOfCustomer: Int) {
        for number in 1...numberOfCustomer {
            self.customerList.enqueue(BankCustomer(number: number, purpose: WorkType.allCases.randomElement()))
        }
    }
    
    mutating private func endWork() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(self.numberOfCustomer)명이며, 총 업무시간은 \(self.totalWorkTime.stringValue)초입니다.")
        self.totalWorkTime = 0.0
        self.numberOfCustomer = 0
    }
}
