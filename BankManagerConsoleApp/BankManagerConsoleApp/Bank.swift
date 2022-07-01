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
    
    private func processTask(task: (Int, String)) {
        let bankTask = DispatchWorkItem {
            while self.manager.isNotEmptyQueue {
                print("\(self.manager.transferTask().count)번 고객 \(self.manager.transferTask().task) 시작")
            }
        }
        
        bankClerk.sync(execute: bankTask)
    }
}
