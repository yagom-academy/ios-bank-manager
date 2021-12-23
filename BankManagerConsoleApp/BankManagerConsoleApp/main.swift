import Foundation

runBankManagerConsole()

func runBankManagerConsole() {
    while true {
        printMenu()
        do {
            let inputValue = try input(with: "입력 : ", useTrim: true)
            
            switch inputValue {
            case "1":
                print("은행 개점하였습니다.")
            case "2":
                return
            default:
                print("입력값이 잘못되었습니다.")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

func printMenu() {
    let message = """
    1 : 은행 개점
    2 : 종료
    """
    print(message)
}

func input(with message: String = "", useTrim: Bool = false) throws -> String {
    let emptyString = ""
    print(message, separator: emptyString, terminator: emptyString)
    guard var inputValue = readLine() else {
        throw InputError.invalidInput
    }
    if useTrim == true {
        inputValue = inputValue.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    return inputValue
}
