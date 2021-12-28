import Foundation

protocol BankDelegate {
    func closeBusiness(by completedClientCount: Int, workHours: String)
    func startWork(for client: Client)
    func finishWork(for client: Client)
}
