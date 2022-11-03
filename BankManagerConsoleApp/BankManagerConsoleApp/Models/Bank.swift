//  Created by stone, 애종 on 2022/11/02.

import Foundation

struct Bank {
    private var manager: BankManager = BankManager()
    private var customerList: Queue<Customer> = Queue()
    var totalWorkTime: Decimal = 0.0
    var numberOfCustomer: Int = 0
    
    mutating func startConsoleApp() {
        print("""
            1 : 은행 개점
            2 : 종료
            입력 :
            """, terminator: " ")
        
        guard let input = readLine() else { return }
        
        switch input {
        case "1":
            openBank()
            startConsoleApp()
        case "2":
            break
        default:
            startConsoleApp()
        }
    }
    
    mutating func openBank() {
        numberOfCustomer = Int.random(in: 10...30)
        registerCustomers(with: numberOfCustomer)
        
        while !customerList.isEmpty {
            manager.provideService(to: customerList.dequeue())
            totalWorkTime += Decimal(0.7)
        }
        
        closeBank()
    }
    
    mutating func registerCustomers(with numberOfCustomer: Int) {
        for number in 1...numberOfCustomer {
            self.customerList.enqueue(Customer(number: number))
        }
    }
    
    mutating func closeBank() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(totalWorkTime.doubleValue)초입니다.")
        self.totalWorkTime = 0.0
        self.numberOfCustomer = 0
    }
}
