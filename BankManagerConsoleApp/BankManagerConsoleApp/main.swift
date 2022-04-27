//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

fileprivate extension Constants {
    static let range: ClosedRange<Int> = 10 ... 30
    static let workSpeed: UInt32 = 700000
    static let bankOpen = "1"
    static let exit = "2"
    static let menu = """
    1 : 은행개점
    2 : 종료
    입력 :
    """
    static let whiteSpace = " "
    static let temporaryName = "임시이름"
}

do {
    let bankClerk = BankClerk(name: Constants.temporaryName, workSpeed: Constants.workSpeed)
    let bank = Bank(bankClerk: bankClerk, clientCount: Int.random(in: Constants.range))
    try startProgram(bank: bank, bankClerk: bankClerk)
} catch {
    print(error.localizedDescription)
}

func startProgram(bank: Bank, bankClerk: BankClerk) throws {
    while true {
        printMenu()
        let userInput = try receivedUserInput()
        
        switch userInput {
        case Constants.bankOpen:
            bank.open()
        case Constants.exit:
            return
        default:
            continue
        }
    }
}

fileprivate func printMenu() {
    let menu = Constants.menu
    print(menu, terminator: Constants.whiteSpace)
}

fileprivate func receivedUserInput() throws -> String {
    guard let userInput = readLine() else {
        throw BankError.wrongInput
    }
    
    return userInput
}
