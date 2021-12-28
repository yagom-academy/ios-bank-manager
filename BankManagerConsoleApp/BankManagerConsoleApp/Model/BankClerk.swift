import Foundation

struct BankClerk {
    func work(for client: Client) {
        print(ConsoleBundle.TaskMessage.startMessage(clientNumber: client.waitingNumber))
        Thread.sleep(forTimeInterval: 0.7)
        print(ConsoleBundle.TaskMessage.completeMessage(clientNumber: client.waitingNumber))
    }
}
