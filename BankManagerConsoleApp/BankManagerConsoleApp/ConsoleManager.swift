import Foundation

struct ConsoleManager {
    static func run() {
        while true {
            printMenu()
            switch receiveInput() {
            case ConsoleBundle.Menu.open:
                BankManager.createBank(delegate: ConsoleManager())
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

extension ConsoleManager: BankDelegate {
    func closeBusiness(by completedClientCount: Int, workHours: String) {
        print(ConsoleBundle.TaskMessage.closeMessage(
            count: completedClientCount,
            duration: workHours))
    }
    
    func startWork(for client: Client) {
        print(ConsoleBundle.TaskMessage.startMessage(client: client))
    }
    
    func finishWork(for client: Client) {
        print(ConsoleBundle.TaskMessage.completeMessage(client: client))
    }
}
