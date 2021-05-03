//
//  ConsoleViewController.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/04/27.
//

import Foundation

struct ConsoleViewController {
    func showStartMenu() {
        print(
 """
 1 : 은행개점
 2 : 종료
 입력 : 
 """, terminator: "")
    }
    
    func shouldContinue() -> Result<Bool, BankManagerError> {
        guard let userInput = readLine() else {
            return .failure(.invalidUserInput)
        }
        
        switch userInput {
        case "1":
            return .success(true)
        case "2":
            return .success(false)
        default:
            return .failure(.invalidUserInput)
        }
    }
}
