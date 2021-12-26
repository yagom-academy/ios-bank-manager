import Foundation

protocol BankClerkDelegate {
    func bankClerk(didStartWork customerNumber: Int)
    func bankClerk(didFinishWork customerNumber: Int)
}
