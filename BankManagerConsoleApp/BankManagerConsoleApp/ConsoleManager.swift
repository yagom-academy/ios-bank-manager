//
//  ConsoleManager.swift
//  BankManagerConsoleApp
//
//  Created by jyubong, Toy on 11/16/23.
//

struct ConsoleManager {
    private enum Message {
        static let menu = """
                          1 : 은행개점
                          2 : 종료
                          입력 :
                          """
        static let reselection = "메뉴를 다시 선택해주세요."
    }
    
    private enum Choice {
        case start
        case end
        case wrong
        
        init(userInput: String?) {
            switch userInput {
            case "1":
                self = .start
            case "2":
                self = .end
            default:
                self = .wrong
            }
        }
    }
    
    private var randomCustomerNumber: UInt { UInt.random(in: 10...30) }
    
    func startBank() {
        print(Message.menu, terminator: " ")
        
        process(userChoice: readLine())
    }
    
    private func process(userChoice: String?) {
        let choice = Choice(userInput: userChoice)
        
        switch choice {
        case .start:
            Bank(customerNumber: randomCustomerNumber).open()
        case .end:
            return
        case .wrong:
            print(Message.reselection)
        }
        
        startBank()
    }
}
