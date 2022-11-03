//  Created by stone, 애종 on 2022/11/02.

import Foundation

struct Bank {
    private var manager: BankManager = BankManager()
    private var customerList: Queue<Customer> = Queue()
    private var numberOfCustomer: Int = 0
    var totalWorkTime: Decimal = 0.0
    
    mutating func startConsoleApp() {
        print("""
            1 : 은행 개점
            2 : 종료
            입력 :
            """, terminator: " ")
        
        guard let userInput = readLine() else { return }
        
        switch userInput {
        case "1":
            openBank()
            closeBank()
            startConsoleApp()
        case "2":
            break
        default:
            startConsoleApp()
        }
    }
    
    mutating func openBank() {
        self.numberOfCustomer = Int.random(in: 10...30)
        registerCustomers(with: self.numberOfCustomer)
        
        while !self.customerList.isEmpty {
            self.manager.provideService(to: self.customerList.dequeue())
            self.totalWorkTime += Decimal(0.7)
        }
    }
    
    mutating func registerCustomers(with numberOfCustomer: Int) {
        for number in 1...numberOfCustomer {
            self.customerList.enqueue(Customer(number: number))
        }
    }
    
    mutating func closeBank() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(self.numberOfCustomer)명이며, 총 업무시간은 \(self.totalWorkTime.doubleValue)초입니다.")
        self.totalWorkTime = 0.0
        self.numberOfCustomer = 0
    }
}
