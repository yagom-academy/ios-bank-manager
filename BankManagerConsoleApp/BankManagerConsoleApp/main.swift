//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
<<<<<<< Updated upstream
=======

struct Bank {
    var totalBanker: Int = 1
//    var customer: Customer
//
//    init(customer: Customer) {
//        self.customer = customer
//    }
}

extension Bank {
    mutating func makingWaitingLine(from totalCustomerNumber: Int) -> Queue<Int> {
        var waitingLine = Queue<Int>()
        for i in 1...totalCustomerNumber {
            waitingLine.enqueue(i)
        }
        
        return waitingLine
    }
    
    mutating func notifyClosing(totalCustomer: Int) {
        let needTimeForTask = 0.7
        let totalTime = Double(totalCustomer) * needTimeForTask
        print("총 \(totalCustomer)입니다. 걸린 시간은 \(totalTime)")
    }

    // inout은 잘 안쓰는 느낌이 있다. -> point느낌이라서
//    mutating func makeCustomer(customer: Customer) {
//        self.customer = customer
//    }
}

struct Customer {
    var number: Int
    // 고객이라는 객체가 1명
    init() {
        let range = (10...30)
        let totalNumber = Int.random(in: range)
        self.number = totalNumber
    }
}

struct Banker {
    var capacityCustomerNumber: Int = 1
}

extension Banker {
    mutating func takeTask(watingLine: inout Queue<Int>) {
        let customer = watingLine.peek()
        print("\(String(describing: customer))번 고객 업무가 시작되었습니다.")
//        let work = watingLine.dequeue()
        print("\(String(describing: work))번 고객 업무가 끝났습니다.)")
    }
}
// inout 디스패치 확인해보기


func start() {
    var bank = Bank()
    var banker = Banker()
    let totalCustomer = Customer().number
    var waitingLine = bank.makingWaitingLine(from: totalCustomer)
    
    for _ in 1...totalCustomer {
        banker.takeTask(watingLine: &waitingLine)
    }
    
    bank.notifyClosing(totalCustomer: totalCustomer)
}

func end() {
    return
}

func main() {
    let input = readLine()
    
    if input == "1" {
        start()
        
    }
    end()
}

main()
>>>>>>> Stashed changes
