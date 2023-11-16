//
//  ConsoleManager.swift
//  BankManagerConsoleApp
//
//  Created by jyubong, Toy on 11/16/23.
//

enum ConsoleManager {
    private static let menu = """
                              1 : 은행개점
                              2 : 종료
                              입력 :
                              """
    
    static func startBank() {
        print(menu, terminator: " ")
        
        process(userChoice: readLine())
    }
    
    private static func process(userChoice: String?) {
        switch userChoice {
        case "1":
            Bank(customerNumber: randomCustomerNumber()).open()
        case "2":
            return
        default:
            print("메뉴를 다시 선택해주세요.")
        }
        
        startBank()
    }
    
    private static func randomCustomerNumber() -> UInt {
        return UInt.random(in: 10...30)
    }
}
