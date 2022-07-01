//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by dhoney96 on 2022/07/01.
//
import Foundation

class Bank {
    private let numberOfClerk: Int = 1
    private let manager = BankManager()
    
    let bankClerk = DispatchQueue(label: "first")
    
    private func processTask() {
        let bankTask = DispatchWorkItem {
            while self.manager.isNotEmptyQueue {
                let cusomter = self.manager.transferTask()
                print("\(cusomter.count)번 고객 \(cusomter.task) 시작")
            }
        }
        bankClerk.sync(execute: bankTask)
    }
    
    func doBusiness() {
        while true {
            print("1 : 은행개점")
            print("2 : 종료")
            print("입력 : ", terminator: "")
            let commandLineInput = readLine()
            switch commandLineInput {
            case "1":
                manager.appendCustomerToQueue(from: [Customer(task: "업무1"), Customer(task: "업무2")])
                processTask()
            case "2":
                break
            default:
                continue
            }
        }
    }
}
