//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by dhoney96 on 2022/07/01.
//
import Foundation

final class Bank {
    private let numberOfClerk: Int = 1
    private let manager = BankManager()
    private let bankClerk = DispatchQueue(label: "first")
    
    func doBusiness() {
        while true {
            print("1 : 은행개점")
            print("2 : 종료")
            print("입력 : ", terminator: "")
            guard let commandLineInput = readLine() else { return }
            switch commandLineInput {
            case BankNameSpace.open:
                manager.appendCustomerToQueue(from: createCustomer())
                processTask()
            case BankNameSpace.close:
                return
            default:
                continue
            }
        }
    }
    
    private func processTask() {
        let date = Date()
        var totalCustomer = 0
        let bankTask = DispatchWorkItem {
            while self.manager.isNotEmptyQueue {
                self.workBankTeller()
                totalCustomer += 1
            }
        }
        bankClerk.sync(execute: bankTask)
        
        let totalTime = String(format: "%.2f", -date.timeIntervalSinceNow)
        print("업무가 마감되었습니다.", terminator: "")
        print("오늘 업무를 처리한 인원은 \(totalCustomer)명이며,", terminator: " ")
        print("총 업무 시간은 \(totalTime)초입니다.")
    }
    
    private func workBankTeller() {
        do {
            let customer = try self.manager.transferTask()
            print("\(customer.count)번 고객 \(customer.task) 시작")
            usleep(700000)
            print("\(customer.count)번 고객 \(customer.task) 종료")
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
