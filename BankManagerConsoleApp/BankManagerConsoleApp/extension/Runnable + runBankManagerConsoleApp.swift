//
//  Runnable + runBankManagerConsoleApp.swift
//  BankManagerConsoleApp
//
//  Created by jeremy, LJ on 2022/11/03.
//

extension Runnable {
    
    func runBankManagerConsoleApp() {
        jlBank.displayMenu()
        let input: String? = jlBank.getInput()
        switch input {
        case MenuSelection.first.rawValue:
            jlBank.openBank()
            runBankManagerConsoleApp()
        case MenuSelection.second.rawValue:
            return
        default:
            print("잘못된 입력입니다.")
            runBankManagerConsoleApp()
        }
    }
}
