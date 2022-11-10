//
//  Department.swift
//  BankManagerConsoleApp

import Foundation

struct Department {
    private let bankService: BankService
    private let numberOfClerks: Int
    private let customerQueue: DispatchQueue
    private let queueSemaphore: DispatchSemaphore
    
    private var serviceName: String {
        switch self.bankService {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
    private var timePerService: Double {
        switch self.bankService {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    init(service: BankService, numberOfClerks: Int) {
        self.bankService = service
        self.numberOfClerks = numberOfClerks
        self.customerQueue = DispatchQueue(label: "\(service)", attributes: .concurrent)
        self.queueSemaphore = DispatchSemaphore(value: numberOfClerks)
    }

    func handleCustomer(_ customer: Customer, dispatchGroup: DispatchGroup) {
        customerQueue.async(group: dispatchGroup) { [self] in
            self.queueSemaphore.wait()
            self.handleBankingService(customer)
            self.queueSemaphore.signal()
        }
    }
    
    private func handleBankingService(_ customer: Customer) {
        print("\(customer.waitingNumber)번 고객 \(self.serviceName)업무 시작")
        
        Thread.sleep(forTimeInterval: self.timePerService)
        
        print("\(customer.waitingNumber)번 고객 \(self.serviceName)업무 완료")
    }
}
