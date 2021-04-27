//
//  ConsoleViewController.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/04/27.
//

import Foundation

protocol ConsoleViewer {
    func showStartMenu()
}

extension ConsoleViewer {
    func showStartMenu() {
        print("""
 1 : 은행개점
 2 : 종료
 입력 : 
 """, terminator: "")
    }
}

protocol Looper {
    func shouldContinue(userInput: String) -> Bool
}

extension Looper {
    func shouldContinue(userInput: String) -> Bool {
        return userInput == "1" ? true : false
    }
}
