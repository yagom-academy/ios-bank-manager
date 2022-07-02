//
//  Console.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/07/02.
//

struct Console {
    func startApp() {
        print(NameSpace.consoleAppStartOutput, terminator: "")
        guard let input = readLine()?.trimmingCharacters(in: .whitespaces) else { return }
        
        if input == "1" {
            let randomCustomers = BankCustomer.generateRandomCustomer()
            var bank = Bank(customerQueue: randomCustomers)
            
            bank.openAgency()
            bank.closeAgency()
            startApp()
        } else if input == "2" {
            return
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요🥲")
            startApp()
        }
    }
}
