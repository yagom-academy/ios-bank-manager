//  Created by stone, 애종 on 2022/11/02.

import Foundation

struct Bank {
    private var manager: Workable
    private var customerList: Queue<Customer>
    private var numberOfCustomer: Int
    private var totalWorkTime: Decimal
    private var group: DispatchGroup = DispatchGroup()
    
    init(manager: Workable, customerList: Queue<Customer>) {
        self.manager = manager
        self.customerList = customerList
        self.numberOfCustomer = 0
        self.totalWorkTime = 0
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
            openBank()
            group.wait()
            closeBank()
            startConsoleApp()
        
        case Namespace.closeBank:
            break
        default:
            startConsoleApp()
        }
    }
    
    mutating private func openBank() {
        self.numberOfCustomer = Int.random(in: 10...30)
        registerCustomers(with: self.numberOfCustomer)
        
        startWork()
    }
    
    mutating private func startWork() {
        let semaphore = DispatchSemaphore(value: 2)
        let loanQueue = DispatchQueue(label: WorkType.loan.rawValue)
        
        while !self.customerList.isEmpty {
            let bankCustomer = self.customerList.dequeue() as? BankCustomer
            
            switch bankCustomer?.type {
            case .deposit:
                semaphore.wait()
                DispatchQueue.global().async(group: group) { [self] in
                    self.manager.provideService(to: bankCustomer)
                    semaphore.signal()
                }
            case .loan:
                loanQueue.async(group: group) { [self] in
                    self.manager.provideService(to: bankCustomer)
                }
            default:
                break
            }
        }
    }
    
    mutating private func registerCustomers(with numberOfCustomer: Int) {
        for number in 1...numberOfCustomer {
            self.customerList.enqueue(BankCustomer(number: number, type: WorkType.allCases.randomElement()))
        }
    }
    
    mutating private func closeBank() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(self.numberOfCustomer)명이며, 총 업무시간은 \(self.totalWorkTime.doubleValue)초입니다.")
        self.totalWorkTime = 0.0
        self.numberOfCustomer = 0
    }
}
