//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Mangdi, Mene on 2022/11/02.
//

import Foundation

struct BankManager {
//        let numberOfCustomer: Int
//        var customerQueue: CustomerQueue<Customer>
    
    func openUp() {
        selectMenu()
    }
    
    private func selectMenu() {
        print("""
              1 : 은행개점
              2 : 종료
              입력 :
              """, terminator: " ")
        guard let userInput = readLine()?.replacingOccurrences(of: " ", with: "") else { return }
        
        switch userInput {
        case "1":
            break
        case "2":
            break
        default:
            print("입력이 잘못되었습니다. \n")
            selectMenu()
        }
    }
}
