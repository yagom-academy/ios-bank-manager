//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/28.
//

import Foundation

final class BankManager {
    private var bankers: [Banker] = []
    private var customers = Queue(listType: DoubleStack<Customer>())
    private var numberOfCustomer: Int = Const.defaultCount
    private var wholeWorkTime: Double = Double.zero
    
    init(numberOfBanker: Int = Const.defaultBankerCount) {
        initialize(numberOfBanker: numberOfBanker)
    }
    
    private func initialize(numberOfBanker: Int = Const.defaultBankerCount) {
        numberOfCustomer = Int.random(in: Const.customerRange)
        for numberTicekt in Const.startCount...numberOfCustomer {
            customers.enQueue(data: Customer(numberTicekt: numberTicekt))
        }
        
        for _ in Const.startCount...numberOfBanker {
            bankers.append(Banker())
        }
    }
    
    func decideOpenBank() {
        if openBank() == true {
            decideOpenBank()
        }
    }
    
    private func openBank() -> Bool {
        print(Const.startBankSelect, terminator: Const.blank)
        guard let userChoice = readLine() else {
            print(Const.wrongInput)
            return true
        }
        
        switch userChoice {
        case Const.OpeningInput:
            doWorking()
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
    
    
    private func doWorking() {
        while customers.isEmpty == false {
            manageBankers()
        }
    }
    
    private func manageBankers() {
        _ = bankers.map { banker in
            if customers.isEmpty == false {
                let customer = customers.deQueue()
                banker.customer = customer
                banker.work()
                wholeWorkTime += Const.workTimeForCustomer
            }
        }
    }
}
