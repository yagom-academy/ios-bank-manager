//
//  BankManagerConsoleApp - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
import BankManager

run()

func run() {
    printMenu()
    
    do {
        try inputMenu()
    } catch InputError.nilInput {
        print("nil을 입력 받았습니다.")
    } catch InputError.exceptionalInput {
        print("1, 2 외의 입력을 받았습니다.")
    } catch {
        print("알 수 없는 에러가 발생했습니다.")
    }
}

func inputMenu() throws {
    let input = readLine()
    
    guard let safeInput = input else {
        throw InputError.nilInput
    }
    
    switch safeInput {
    case "1":
        manageBanking()
    case "2":
        print("프로그램을 종료합니다.")
        return
    default:
        throw InputError.exceptionalInput
    }
    
    run()
}

func printMenu() {
    print("1 : 은행 개점\n2 : 종료")
    print("입력 : ", terminator: "")
}

func manageBanking() {
    var bank = Bank()
    let randomNumber = Int.random(in: 10...30)
    
    for _ in 0..<randomNumber {
        bank.clients.enqueue(element: Client())
    }
    
    while !bank.clients.isEmpty {
        bank.manager.startTask()
        bank.clients.dequeue()
        bank.manager.endTask()
    }
    
    bank.manager.finishTasks()
}
