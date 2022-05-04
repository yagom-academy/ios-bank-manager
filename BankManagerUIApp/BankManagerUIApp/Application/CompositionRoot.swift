//
//  CompositionRoot.swift
//  BankManagerUIApp
//
//  Created by 조민호 on 2022/05/04.
//

import UIKit

final class CompositionRoot {
    private typealias QueueDictionary = [String: Queue<Client>]
    
    private let numberOfDepositBankClerks: Int
    private let numberOfLoanBankClerks: Int
    private let clientCountRange: ClosedRange<Int>
    
    init(
        numberOfDepositBankClerks: Int,
        numberOfLoanBankClerks: Int,
        clientCountRange: ClosedRange<Int>
    ) {
        self.numberOfDepositBankClerks = numberOfDepositBankClerks
        self.numberOfLoanBankClerks = numberOfLoanBankClerks
        self.clientCountRange = clientCountRange
    }
    
    struct Dependency {
        let bank: Bank
        let mainViewController: MainViewController
    }
    
    func resolve() -> Dependency {
        let bank = Bank(
            bankClerks: createBankClerk(
                numberOfDepositBankClerks,
                numberOfLoanBankClerks
            ),
            clientCount: Int.random(in: clientCountRange),
            queueDictionary: createQueueDictionary()
        )
        
        let mainViewController = MainViewController.instance(bank: bank)
        
        return Dependency(
            bank: bank,
            mainViewController: mainViewController
        )
    }
    
    func setWindow(window: UIWindow, dependency: Dependency) {
        window.rootViewController = dependency.mainViewController
        window.makeKeyAndVisible()
    }

    private func createQueueDictionary() -> QueueDictionary {
        var queueDictionary: QueueDictionary = [:]
        
        BankServiceType.allCases.forEach { bankService in
            queueDictionary.updateValue(Queue<Client>(), forKey: bankService.description)
        }
        
        return queueDictionary
    }

    private func createBankClerk(
        _ numberOfDepositBankClerks: Int,
        _ numberOfLoanBankClerks: Int
    ) -> [BankClerk] {
        var bankClerks: [BankClerk] = []
        
        for order in 1 ... numberOfDepositBankClerks {
            bankClerks.append(
                BankClerk(
                    name: "\(BankServiceType.deposit)\(order)",
                    bankService: .deposit
                )
            )
        }
        
        for order in 1 ... numberOfLoanBankClerks {
            bankClerks.append(
                BankClerk(
                    name: "\(BankServiceType.loan)\(order)",
                    bankService: .loan
                )
            )
        }
        
        return bankClerks
    }
}


