//
//  Console.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/07/02.
//

struct Console {
    func startApp() {
        print(ConsoleTask.consoleAppStartOutput, terminator: "")
        guard let input = readLine()?.trimmingCharacters(in: .whitespaces) else { return }
        
        if input == ConsoleTask.open {
            var bank = Bank(numberOfDepositBankers: 2, numberOfLoanBankers: 1)
            
            bank.open()
            bank.close()
            startApp()
        } else if input == ConsoleTask.close {
            return
        } else {
            print(ConsoleTask.wrongInput)
            startApp()
        }
    }
}
