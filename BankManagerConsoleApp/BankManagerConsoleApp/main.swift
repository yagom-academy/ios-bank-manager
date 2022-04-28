import Foundation

let menuString = """
1 : 은행개점
2 : 종료
입력 :
"""

func printMenu() {
    print(menuString, terminator: " ")
}

func inputMenu() {
    guard let input = readLine() else {
        return
    }
    
    if input == "1" {
        let bank = Bank(numberOfBankManager: 1, numberOfCustomer: Int.random(in: 10...30))
        bank.makeBankManagerWork()
        printMenu()
        inputMenu()
    } else if input == "2" {
        return
    } else {
        printMenu()
        inputMenu()
    }
}

printMenu()
inputMenu()
