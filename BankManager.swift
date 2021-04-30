//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Bank {
    let teller = Teller(tellerIndex: 1)
    var client = Queue<Int>()
    
    func startService() {
        showInitialMenu()
        
        guard let input = receiveUserInput() else { return }
        switch input {
                case SelectMenu.start.rawValue:
                    enqueueClient(pickRandomClientsNumber())
                    conductService(by: teller)
                    startService()
                case SelectMenu.end.rawValue:
                    return
                default:
                    print(Messages.unknownInputMessage.rawValue)
                    startService()
                }
    }
    
    private func showInitialMenu() {
        print(Messages.initialChoiceMessage.rawValue)
        print("입력", terminator: " : ")
    }
    
    private func receiveUserInput() -> String? {
        let userInput = readLine()
        
        guard let input = userInput else {
            return nil
        }
        
        return input
    }
    
    private func pickRandomClientsNumber() -> Int {
        let randomClientsNumber = Int.random(in: 10...30)
        return randomClientsNumber
    }
    
    private func enqueueClient(_ clientNumber: Int) {
        for index in 1...clientNumber {
            client.enqueue(index)
        }
    }
    
    private func conductService(by teller: Teller) {
        var workhours: Double = 0
        var clientsCount: Int = 0
        
        while !client.isEmpty {
            guard let firstClientNumber = client.front else {
                return
            }

            teller.announceServiceStart(firstClientNumber)
            usleep(700000)
            teller.announceServiceFinish(firstClientNumber)
            client.dequeue()
            workhours = sumOfficeHours(workhours)
            clientsCount += 1
        }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientsCount)명이며, 총 업무시간은 \(String(format: "%.1f", workhours))초입니다.")
    }
    
    private func sumOfficeHours(_ unithour: Double) -> Double {
        return unithour + 0.7
    }
}
