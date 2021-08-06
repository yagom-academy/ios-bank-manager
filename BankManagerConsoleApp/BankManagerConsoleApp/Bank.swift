//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/08/03.
//

import Foundation

class Bank {
    //MARK: Properties
    private var bankClerk: BankClerk
    private var waitingLine = Queue<Customer>()
    
    init(bankClerk: BankClerk = BankClerk()) {
        self.bankClerk = bankClerk
    }
}

//MARK:- Bank Running Method
extension Bank {
    func makeWaitingLine(from totalCustomerNumber: Int) {
        for i in 1...totalCustomerNumber {
            waitingLine.enqueue(Customer(ticketNumber: i))
        }
    }
    
    func dequeueCustomer() -> Customer? {
        return waitingLine.dequeue()
    }
    
    func letClerkWork(_ loanWorkTime: Double, _ depositWorkTime: Double) {
        let semaphore = DispatchSemaphore(value: 2)
        let loanGroup = DispatchGroup()
        let depositGroup = DispatchGroup()
        let loanQueue = DispatchQueue(label: "loanQueue")
        let depositQueue = DispatchQueue.global()
        var loanCusomerNubmer = 0
        var depositCustomerNumber = 0
        
        while waitingLine.isEmpty() == false {
            guard let currentCustomer = dequeueCustomer(),
                  let customerBusiness = currentCustomer.business else {
                return
            }
            
            switch customerBusiness {
            case "대출":
                loanCusomerNubmer += 1
                loanGroup.enter()
                loanQueue.async {
                    self.bankClerk.work(for: currentCustomer, during: loanWorkTime)
                    loanGroup.leave()
                }
            case "예금":
                depositCustomerNumber += 1
                depositGroup.enter()
                semaphore.wait()
                depositQueue.async(group: depositGroup) {
                    self.bankClerk.work(for: currentCustomer, during: depositWorkTime)
                    semaphore.signal()
                    depositGroup.leave()
                }
            default:
                print("error")
            }
        }
        
        loanGroup.notify(queue: loanQueue) {
            self.notifyClosing(totalCustomer: loanCusomerNubmer + depositCustomerNumber, totalTime: "10")
        }
    }
    
    func notifyClosing(totalCustomer: Int, totalTime: String) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.roundingMode = .halfUp
        let convertedTotalTime = numberFormatter.string(for: Double(totalTime)) ?? "0"
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(convertedTotalTime)초입니다.")
    }
}
