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
                continue
            }
        }
    }
    
    static func printMenu() {
        print(ConsoleBundle.Menu.explainMessage)
    }
    
    static func receiveInput() -> String {
        print(ConsoleBundle.Menu.inputMessage, terminator: "")
        guard let input = readLine() else {
            return ""
        }
        return input
    }
}
