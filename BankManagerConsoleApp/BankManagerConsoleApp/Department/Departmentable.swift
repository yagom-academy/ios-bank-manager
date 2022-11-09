//
//  Departmentable.swift
//  BankManagerConsoleApp

import Foundation

protocol Departmentable {
    var bankService: BankService { get }
    var numberOfClerks: Int { get }
    var customerQueue: DispatchQueue { get }
    var queueSemaphore: DispatchSemaphore { get }
}

extension Departmentable {
    var serviceName: String {
        switch self.bankService {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
    var timePerService: Double {
        switch self.bankService {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    mutating func handleCustomer(_ customer: Customer, dispatchGroup: DispatchGroup) {
        customerQueue.async(group: dispatchGroup) { [self] in
            self.queueSemaphore.wait()
            self.handleBankingService(customer)
            self.queueSemaphore.signal()
        }
    }
    
    func handleBankingService(_ customer: Customer) {
        print("\(customer.waitingNumber)번 고객 \(self.serviceName)업무 시작")
        
        Thread.sleep(forTimeInterval: self.timePerService)
        
        print("\(customer.waitingNumber)번 고객 \(self.serviceName)업무 완료")
    }
}
