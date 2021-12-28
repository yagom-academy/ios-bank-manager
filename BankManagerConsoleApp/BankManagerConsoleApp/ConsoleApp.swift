
import Foundation

struct ConsoleApp {
    func run() {
        printMenu()
        determineBankOpen()
    }

    private func printMenu() {
        let message = """
        1 : 은행 개점
        2 : 종료
        """
        print(message)
    }

    private func determineBankOpen() {
        do {
            let inputValue = try input(with: "입력 : ", useTrim: true)
            
            switch inputValue {
            case "1":
                openBank()
                run()
            case "2":
                return
            default:
                print("입력값이 잘못되었습니다.")
                run()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func openBank() {
        var bank = Bank(bankers: [GeneralBanker()])
        bank.operate()
    }

    private func input(with message: String = "", useTrim: Bool = false) throws -> String {
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
}
