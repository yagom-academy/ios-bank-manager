//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printOpenBank() {
    print("1 : 은행 개점\n2 : 종료\n입력 : ", terminator:"")
}

func inputNumber() -> String {
    guard let input = readLine() else { print("입력하지 않아서 종료합니다."); return "0" }
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
    var clients: BankClient? = BankClient(clientNumber: 0, numberOfClient: Int.random(in: 10...30), client: [0])
    
    guard let maxNumberOfClient: Int = clients?.numberOfClient else { print("maxNumber error"); return }
    guard var clientNumber: Int = clients?.clientNumber else { print("clientNumber error"); return }
    clients?.client = [Int](repeating: clientNumber, count: maxNumberOfClient)
    guard var client: [Int] = clients?.client else { print("clientArray error"); return }
    
    for index in 0...maxNumberOfClient - 1 {
        clientNumber += 1
        client[index] = clientNumber
        bankTask(clientNumber: clientNumber)
    }
    let taskTime: String = String(format: "%.2f", round( Double(maxNumberOfClient) * 0.7 * 100) / 100)
    print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(maxNumberOfClient)명이며, 총 업무시간은 \(taskTime)초입니다.")
    main()
}

func bankTask(clientNumber: Int) {
    print("\(clientNumber)번 고객 업무 시작")
    
    print("\(clientNumber)번 고객 업무 완료")
}

func main() {
    printOpenBank()
    vertifyInput(input: inputNumber())
}

main()
