//
//  ConsoleManager.swift
//  BankManagerConsoleApp
//
//  Created by jyubong, Toy on 11/16/23.
//

enum ConsoleManager {
    private enum Message {
        static let menu = """
                          1 : 은행개점
                          2 : 종료
                          입력 :
                          """
        static let reselection = "메뉴를 다시 선택해주세요."
        static let numberOne = "1"
        static let numberTwo = "2"
    }
    
    private static var randomCustomerNumber: UInt { UInt.random(in: 10...30) }
    
    static func startBank() {
        print(Message.menu, terminator: " ")
        
        process(userChoice: readLine())
    }
    
    private static func process(userChoice: String?) {
        switch userChoice {
        case Message.numberOne:
            Bank(customerNumber: randomCustomerNumber).open()
        case Message.numberTwo:
            return
        default:
            print(Message.reselection)
        }
        
        startBank()
    }
}
