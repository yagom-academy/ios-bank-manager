//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/12.
//

struct Bank {
    private var bankTellers: [BankTeller] = [BankTeller]()
    private var customerQueue: Queue<Customer> = Queue()
    private let numberOfCustomer: Int
    private var workTime: Double {
        //return bankTeller.duty.duration * Double(numberOfCustomer)
        return 0.0
    }
    
    private let printStartMessage: (Customer) -> Void = { customer in
        print(String(format: MessageFormat.startTask, customer.numberTicket, customer.service.description))
    }
    
    private let printFinishMessage: (Customer) -> Void = { customer in
        print(String(format: MessageFormat.finishTask, customer.numberTicket, customer.service.description))
    }
    
    init(numberOfCustomer: Int) {
        self.numberOfCustomer = numberOfCustomer
    }
    
    mutating func open() {
        recruitBankTeller(duty: .deposit, number: 2)
        recruitBankTeller(duty: .loan, number: 1)
        handOutNumberTickets()
        startBusiness()
        closeBusiness()
    }
    
    mutating func recruitBankTeller(duty: BankingService, number: Int) {
        (0..<number).forEach { _ in
            bankTellers.append(BankTeller(duty: duty))
        }
    }
    
    mutating private func handOutNumberTickets() {
        (0..<numberOfCustomer).forEach {
            customerQueue.enqueue(Customer(numberTicket: $0 + 1))
        }
    }
    
    mutating private func startBusiness() {
        while let currentCustomer = customerQueue.dequeue() {
            //bankTeller.doWork(for: currentCustomer, startHandler: printStartMessage, completionHandler: printFinishMessage)
        }
    }
    
    private func closeBusiness() {
        print(String(format: MessageFormat.closing, numberOfCustomer, workTime))
    }
}

extension Bank {
    private enum MessageFormat {
        static let closing: String = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %u명이며, 총 업무시간은 %.2f입니다."
        static let startTask: String = "%u번 고객 %@ 시작"
        static let finishTask: String = "%u번 고객 %@ 완료"
    }
}
