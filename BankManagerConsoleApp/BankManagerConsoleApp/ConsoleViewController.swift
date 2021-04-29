//
//  ConsoleViewController.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/04/27.
//

import Foundation

struct ConsoleViewController {
    var shouldContinue: Bool = true
    
    func showStartMenu() {
        print(
 """
 1 : 은행개점
 2 : 종료
 입력 : 
 """, terminator: "")
    }
    
    mutating func getUserInput() {
        guard let userInput = readLine() else {
            return
        }
        
        switch userInput {
        case "1":
            shouldContinue = true
        case "2":
            shouldContinue = false
        default:
            shouldContinue = false
        }
    }
    
}
