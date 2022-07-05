//
//  BankService.swift
//  BankManagerConsoleApp
//
//  Created by 휴, 보리사랑 on 2022/07/04.
//
class BankService {
    var bank: Bank
    
    init() {
        self.bank = Bank()
    }
    
    private func createCustomer() -> [Customer] {
        var customers = [Customer]()
        let tasks = [Command.deposit.description, Command.loan.description]
        for _ in 1...Int.random(in: 10...30) {
            let customer = Customer(task: tasks.randomElement() ?? Command.deposit.description)
            customers.append(customer)
        }
        return customers
    }
    
    func start() {
        bank.doBusiness(customers: createCustomer())
    }
}
