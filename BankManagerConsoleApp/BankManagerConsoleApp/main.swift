//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printMenu() {
    print("1 : 은행 개점\n2 : 종료\n입력 : ", terminator:"")
}

func inputNumber() -> String {
    guard let input = readLine() else { return "0" }
    return input
}

func vertifyInput(input: String) {
    switch input {
    case "1":
        openBank()
    case "2":
        return
    default:
        print("잘못 입력하였습니다. 다시 입력하세요.")
        main()
    }
}

func openBank() {
    var client: BankClient? = BankClient(clientNumber: 0, numberOfClient: Int.random(in: 10...30), clientArray: [0])
    
    guard let maxNumberOfClient: Int = client?.numberOfClient else { return }
    guard var clientNumber: Int = client?.clientNumber else { return }
    client?.clientArray = [Int](repeating: clientNumber, count: maxNumberOfClient)
    guard var clientArray: [Int] = client?.clientArray else { return }
    
    for index in 0...maxNumberOfClient - 1 {
        clientNumber += 1
        clientArray[index] = clientNumber
        print("\(clientNumber)번 고객 업무 시작")
        print("\(clientNumber)번 고객 업무 완료")
    }
    let taskTime: String = String(format: "%.2f", round(Double(maxNumberOfClient) * 0.7 * 100) / 100)
    print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(maxNumberOfClient)명이며, 총 업무시간은 \(taskTime)초입니다.")
    main()
}

func main() {
    printMenu()
    vertifyInput(input: inputNumber())
}

main()
