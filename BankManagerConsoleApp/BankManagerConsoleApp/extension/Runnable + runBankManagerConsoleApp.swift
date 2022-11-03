//
//  Runnable + runBankManagerConsoleApp.swift
//  BankManagerConsoleApp
//
//  Created by 유제민 on 2022/11/03.
//

extension Runnable {
    
    func runBankManagerConsoleApp() {
        jlBank.displayMenu()
        let input: String? = jlBank.getInput()
        switch input {
        case "1":
            jlBank.openBank()
            runBankManagerConsoleApp()
        case "2":
            return
        default:
            print("잘못된 입력입니다.")
            runBankManagerConsoleApp()
        }
    }
}
