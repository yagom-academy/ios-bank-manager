//  Created by stone, 애종 on 2022/11/02.

import Foundation

struct Bank {
    private var manager: BankManager
    private var customerList: Queue<Customer>
    var totalWorkTime: Decimal
    
    init() {
        self.manager = BankManager()
        self.customerList = Queue()
        self.totalWorkTime = 0.0
    }
    
    mutating func start() {
        print("""
            1 : 은행 개점
            2 : 종료
            입력 :
            """, terminator: " ")
        
        guard let input = readLine() else { return }
        
        switch input {
        case "1":
            openBank()
        case "2":
            break
        default:
            start()
        }
    }
    
    mutating func openBank() {
        let numberOfCustomer: Int = Int.random(in: 10...30)
        
        for number in 1...numberOfCustomer {
            self.customerList.enqueue(Customer(number: number))
        }
        
        while !customerList.isEmpty {
            manager.provideService(to: customerList.dequeue())
            totalWorkTime += Decimal(0.7)
            print(totalWorkTime)
        }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(totalWorkTime)초입니다.")
    }
}
