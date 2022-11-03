//  Bank.swift
//  BankManagerConsoleApp
//  Created by Baem & Bella on 2022/11/02.

import Foundation

struct Bank {
    private let manager: Int = 1
    private var lineOfCustomer = LinkedList<Customer>()

    mutating func selectMenu() {
        print(" 1 : 은행개점\n 2 : 종료\n입력 :", terminator: " ")
        switch receiveUserInput() {
        case "1":
            openBank()
        case "2":
            return
        default:
            print("잘못된 입력값입니다. 다시 입력해주세요.")
            selectMenu()
        }
    }

    private func receiveUserInput() -> String {
        guard let userInput = readLine() else {
            return receiveUserInput()
        }
        return userInput
    }

    mutating private func openBank() {
        let totalCustomer = Int.random(in: 10...30)

        listUpCustomer(totalCustomer)
        var taskTime = getWorkTimeAfterRunTask()

        taskTime = round(taskTime * 100)/100
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(taskTime)초입니다.")
        selectMenu()
    }

    mutating private func listUpCustomer(_ customerCount: Int) {
        for customerIndex in 1...customerCount {
            lineOfCustomer.enqueue(value: Customer(number: customerIndex))
        }
    }
    
    mutating private func getWorkTimeAfterRunTask() -> Double {
        var taskTime: Double = 0
        
        while lineOfCustomer.isEmpty == false {
            let currentCustomer = lineOfCustomer.dequeue()
            print("\(currentCustomer!.number)번 고객 업무 시작")
            taskTime += 0.7
            usleep(70_000)
            print("\(currentCustomer!.number)번 고객 업무 종료")
        }
        return taskTime
    }
}
