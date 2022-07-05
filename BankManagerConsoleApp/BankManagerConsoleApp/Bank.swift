//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by dhoney96 on 2022/07/01.
//
import Foundation

final class Bank {
    private let numberOfDepositClerk: Int
    private let numberOfLoanClerk: Int
    
    private let manager = BankManager()
    private let depositQueue = OperationQueue()
    private let loanQueue = OperationQueue()
    
    init(numberOfDepositClerk: Int, numberOfLoanClerk: Int) {
        self.numberOfDepositClerk = numberOfDepositClerk
        self.numberOfLoanClerk = numberOfLoanClerk
    }
    
    func doBusiness(customers: [Customer]) {
        while true {
            print("1 : 은행개점")
            print("2 : 종료")
            print("입력 : ", terminator: "")
            guard let commandLineInput = readLine() else { return }
            switch commandLineInput {
            case Command.open.description:
                manager.appendCustomerToQueue(from: customers)
                processTask()
                manager.resetWaitingNumber()
            case Command.close.description:
                return
            default:
                continue
            }
        }
    }
    
    private func processTask() {
        let date = Date()
        var totalCustomer = 0
        depositQueue.maxConcurrentOperationCount = numberOfDepositClerk
        loanQueue.maxConcurrentOperationCount = numberOfLoanClerk
        
        while manager.isNotEmptyQueue {
            workBankTeller()
            totalCustomer += 1
        }
        
        depositQueue.waitUntilAllOperationsAreFinished()
        loanQueue.waitUntilAllOperationsAreFinished()
    
        let totalTime = String(format: "%.2f", -date.timeIntervalSinceNow)
        print("업무가 마감되었습니다.", terminator: "")
        print("오늘 업무를 처리한 인원은 \(totalCustomer)명이며,", terminator: " ")
        print("총 업무 시간은 \(totalTime)초입니다.")
    }
    
    private func workBankTeller() {
        do {
            let customer = try self.manager.fetchTask()
            
            switch customer.task {
            case "예금":
                let depositTask = DepositOperation(task: customer.task, watingNumber: customer.count)
                depositQueue.addOperation(depositTask)
            case "대출":
                let loanTask = LoanOperation(task: customer.task, watingNumber: customer.count)
                loanQueue.addOperation(loanTask)
            default:
                return
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
