import Foundation

func runBankManagerConsole() {
    while true {
        
    }
}

func printMenu() {
    let message = """
    1 : 은행 개점
    2 : 종료
    """
    print(message)
}

func input(with message: String = "") -> String {
    let emptyString = ""
    print(message, separator: emptyString, terminator: emptyString)
    guard let inputValue = readLine() else {
        fatalError()
    }
    return inputValue.trimmingCharacters(in: .whitespacesAndNewlines)
}
