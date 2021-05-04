//
//  BankMangerTest.swift
//  ConsoleAppTest
//
//  Created by 천수현 on 2021/05/04.
//

import XCTest

class BankMangerTest: XCTestCase {
    struct MockBank: Bankable {
        var numberOfBankTeller: Int = 1
        var openTime: CFAbsoluteTime?
        var closeTime: CFAbsoluteTime?
        mutating func openBank() {}
        mutating func closeBank(totalCustomerNumber: Int) throws {}
    }
    
    struct MockConsoleViewController: ConsoleViewControllable {
        var userInput: String = "1"
        mutating func getUserInput() {}
        
        func showStartMenu() {}
        
        func shouldContinue() -> Result<Bool, BankManagerError> {
            return .success(true)
        }
    }
    
    struct MockRandomGenerator: RandomGeneratable {
        var totalCustomer: Int = 10
        
        mutating func generateRandomCustomer() -> [Customer] {
            let randomCustomer = Customer(ticketNumber: 1, priority: .VVIP, task: .loan)
            return [randomCustomer]
        }
    }
    
    var sut: BankManager!
    var dummyBank: Bankable!
    var dummyConsoleViewControllerUserInput1: ConsoleViewControllable!
    var dummyRandomGenerator: RandomGeneratable!
    
    override func setUpWithError() throws {
        dummyBank = MockBank()
        dummyConsoleViewControllerUserInput1 = MockConsoleViewController()
        dummyRandomGenerator = MockRandomGenerator()
        
        sut = BankManager(bank: dummyBank,
                          consoleViewer: dummyConsoleViewControllerUserInput1,
                          randomGenerator: dummyRandomGenerator)
    }

    override func tearDownWithError() throws {
        dummyBank = nil
        dummyConsoleViewControllerUserInput1 = nil
        dummyRandomGenerator = nil
        sut = nil
    }
    
    func test_start() {
        sut.start()
    }

}
