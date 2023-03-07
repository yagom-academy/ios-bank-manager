//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/07.
//

struct BankManager {
    let bank = Bank()
    var clientQueue = Queue<BankClient>()
    let numberOfClient: Int = Int.random(in: 10...30)
    
    func startBankManager() {
        while true {
            printBankMenu()
            let input = receiveUserInput()
            
            switch input {
            case "1":
                print("")
            case "2":
                return
            default:
                print("잘못 입력하셨습니다. 다시 입력해주세요")
            }
        }
    }
    
    func printBankMenu() {
        print("1 : 은행 개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    func receiveUserInput() -> String? {
        let userInput = readLine()
        
        return userInput
    }
    
    mutating func setupClient() {
        for number in 1...numberOfClient {
            clientQueue.enqueue(BankClient(waitingNumber: number))
        }
    }
}
