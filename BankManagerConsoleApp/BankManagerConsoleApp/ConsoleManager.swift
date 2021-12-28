import Foundation

struct ConsoleManager {
    static func run() {
        while true {
            printMenu()
            switch receiveInput() {
            case ConsoleBundle.Menu.open:
                BankManager.createBank()
                BankManager.openBank()
            case ConsoleBundle.Menu.exit:
                return
            default:
                print(ConsoleBundle.Menu.errorMessage)
                continue
            }
        }
    }
    
    private static func printMenu() {
        print(ConsoleBundle.Menu.explainMessage)
    }
    
    private static func receiveInput() -> String {
        print(ConsoleBundle.Menu.inputMessage, terminator: "")
        guard let input = readLine() else {
            return ""
        }
        return input
    }
}
