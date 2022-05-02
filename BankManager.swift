//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/28.
//

import Foundation

final class BankManager {
    var banker = Banker()
    private var customers = Queue(listType: DoubleStack<Customer>())
    private var numberOfCustomer: Int = Const.defaultCount
    private var wholeWorkTime: Double = Double.zero
    
    init(numberOfBanker: Int = Const.defaultBankerCount) {
        initialize(numberOfBanker: numberOfBanker)
    }
    
    func manageBanker() {
        let semaphore = DispatchSemaphore(value: 3)
        let workGroup = DispatchGroup()
        for _ in 1...self.numberOfCustomer {
                semaphore.wait()
                let custormer = self.customers.deQueue()
                DispatchQueue.global().async(group: workGroup) {
                print(Thread.current)
                self.banker.customer = custormer
                self.banker.work()
                self.wholeWorkTime += Const.workTimeForCustomer
                semaphore.signal()
                }
            }
        workGroup.wait()
        }
       
    
    private func initialize(numberOfBanker: Int = Const.defaultBankerCount) {
        numberOfCustomer = Int.random(in: Const.customerRange)
        for numberTicekt in Const.startCount...numberOfCustomer {
            customers.enQueue(data: Customer(numberTicekt: numberTicekt))
        }
    }
    
    func openBank() -> Bool {
        print(Const.startBankSelect, terminator: Const.blank)
        guard let userChoice = readLine() else {
            print(Const.wrongInput)
            return true
        }
        
        switch userChoice {
        case Const.OpeningInput:
            manageBanker()
            print(Const.finishWork)
            print("오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무 시간은 \(String(format: Const.twoDecimal, wholeWorkTime))초 입니다.")
            wholeWorkTime = Double.zero
        case Const.exitInput:
            return false
        default:
            print(Const.wrongInput)
        }
        
        initialize()
        return true
    }
}
