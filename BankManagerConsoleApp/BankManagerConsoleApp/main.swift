import Foundation

let customerRange: ClosedRange = 10...30
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
        let bank = Bank(numberOfBankManager: 1, numberOfCustomer: randomNumber(in: customerRange))
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

func randomNumber(in range: ClosedRange<Int>) -> Int {
    return Int.random(in: range)
}

printMenu()
inputMenu()
