//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/04.
//

import Foundation
import BankCustomerQueue

struct Bank: BankProtocol {
    private struct Constant {
        let invalidInput: String = "잘못된 입력입니다."
        let openOption: String = "1"
        let closeOption: String = "2"
        let menu: String = """
                           1 : 은행 개점
                           2 : 종료
                           입력 :
                           """
        let spacing: String = " "
        let customerCountRange: ClosedRange<Int> = 10...30
        func closingMent(_ customerCount: Int, _ workedTime: TimeInterval) -> String {
            let wasteTime = String(format: "%.2f", workedTime)
            return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(wasteTime)초입니다."
        }
    }
    
    private let constant: Constant = .init()
    private var depositDesk: BankDesk
    private var loanDesk: BankDesk
    
    private var customerQueue: BankCustomerQueue<BankCustomer>
    private var depositCustomerQueue: BankCustomerQueue<BankCustomer>
    private var loanCustomerQueue: BankCustomerQueue<BankCustomer>
    
    private static var completedCustomerCount: Int = .zero
    private var totalWorkedTime: TimeInterval = .zero
    
    private let group: DispatchGroup = .init()
    
    init(depositBankerCount: Int, loanBankerCount: Int) {
        self.depositDesk = BankDesk(banker: depositBankerCount)
        self.loanDesk = BankDesk(banker: loanBankerCount)
        
        self.customerQueue = .init()
        self.depositCustomerQueue = .init()
        self.loanCustomerQueue = .init()
        
        configure()
    }
    
    private mutating func arrangeCustomer() {
        let randomNumber = Int.random(in: constant.customerCountRange)
        
        for _ in 1...randomNumber {
            let bankCustomer: BankCustomer = .init(customerType: .deposit)
            customerQueue.enqueue(bankCustomer)
        }
    }
    
    private mutating func separateCustomer() {
        while let customer = self.customerQueue.dequeue() {
            switch customer.type {
            case .deposit:
                self.depositCustomerQueue.enqueue(customer)
            case .loan:
                self.loanCustomerQueue.enqueue(customer)
            }
        }
    }
    
    mutating func startBusiness() {
        while true {
            floatingMenu()
            
            let menu = readLine()
            
            switch menu {
            case constant.openOption:
                open()
                configure()
            case constant.closeOption:
                return
            default:
                print(constant.invalidInput)
            }
        }
    }
    
    private mutating func configure() {
        arrangeCustomer()
        separateCustomer()
        
        Self.completedCustomerCount = .zero
        BankCustomer.resetCustomerNumber()
    }
    
    private func floatingMenu() {
        print(constant.menu, terminator: constant.spacing)
    }
    
    private mutating func open() {
        let startTime = Date()
        deposit()
        
        group.wait()
        let endTime = Date()
        self.totalWorkedTime = endTime.timeIntervalSince(startTime)
        close()
    }
    
    private mutating func deposit() {
        guard let customer = depositCustomerQueue.dequeue() else {
            return
        }
        
        DispatchQueue.global().async { [self] in
            group.enter()
            depositDesk.work(customer)
            Self.completedCustomerCount += 1
            group.leave()
        }
        
        if depositCustomerQueue.isEmpty() == false {
            deposit()
        }
    }
    
    private func close() {
        print(constant.closingMent(Self.completedCustomerCount, totalWorkedTime))
    }
}
