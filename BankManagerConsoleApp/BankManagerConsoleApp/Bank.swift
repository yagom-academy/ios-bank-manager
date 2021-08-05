//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/08/03.
//

import Foundation

struct Bank {
    private var bankClerk: BankClerk
    private var waitingLine = Queue<Customer>()

    init(bankClerk: BankClerk = BankClerk()) {
        self.bankClerk = bankClerk
    }
    // 의존성주입 : bankclerk에 대한 바뀔 수 있는 여지를 추가로 줌. 또한 외부에서 접근을 막하줌과 동시에 내부에 인스턴스를 가지도록 함
    // 하드코딩 : 코드 내부에 데이터가 그대로 입력되어있는 경우, 모든 하드코딩이 나쁘진 않다
}

extension Bank {
    
//    func configure(bankClerk: BankClerk) {
//        self.bankClerk =
//    } //  언제든지 바꿀 수 있다. 지금의 사용과는 맞지 않다.
    
    mutating func makeWaitingLine(from totalCustomerNumber: Int) {
        for i in 1...totalCustomerNumber {
            waitingLine.enqueue(Customer(ticketNumber: i))
        }
    }
    
    mutating func dequeueCustomer() -> Customer? {
        return waitingLine.dequeue()
    }
    
    private func handleLoan(_ customer: Customer, _ loanWorkTime: Double) {
        let loanQueue = DispatchQueue(label: "loanQueue")
        loanQueue.async {
            bankClerk.work(for: customer, during: loanWorkTime)
        }
    }
    
    private func handleDeposit(_ semaphoreValue: Int, _ customer: Customer, _ depositWorkTime: Double) {
        let semaphore = DispatchSemaphore(value: semaphoreValue)
        let depositGroup = DispatchGroup()
        depositGroup.enter()
        semaphore.wait()
        DispatchQueue.global().async(group: depositGroup) {
            bankClerk.work(for: customer, during: depositWorkTime)
            semaphore.signal()
            depositGroup.leave()
        }
    }
    
    mutating func letClerkWork(_ loanWorkTime: Double, _ depositWorkTime: Double) {
        guard let currentCustomer = dequeueCustomer(),
              let customerBusiness = currentCustomer.business else {
            return
        }
        
        switch customerBusiness {
        case "대출":
            handleLoan(currentCustomer, loanWorkTime)
        case "예금":
            handleDeposit(2, currentCustomer, depositWorkTime)
        default:
            print("unknown")
        }
    }
    
    mutating func notifyClosing(totalCustomer: Int, totalTime: String) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.roundingMode = .halfUp
        let convertedTotalTime = numberFormatter.string(for: Double(totalTime)) ?? "0"
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(convertedTotalTime)초입니다.")
    }
}
