//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by 조민호 on 2022/04/28.
//

fileprivate extension Constants {
    static let bankOpen = "1"
    static let exit = "2"
    static let menu = """
    1 : 은행개점
    2 : 종료
    입력 :
    """
    static let whiteSpace = " "
}

struct BankManager {
    private let bank: Bank
    
    init(bank: Bank) {
        self.bank = bank
    }
    
    func startProgram() throws {
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

    private func printMenu() {
        let menu = Constants.menu
        print(menu, terminator: Constants.whiteSpace)
    }

    private func receivedUserInput() throws -> String {
        guard let userInput = readLine() else {
            throw BankError.wrongInput
        }
        
        return userInput
    }
}
