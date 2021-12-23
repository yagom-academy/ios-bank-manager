import Foundation

protocol BankClerkDelegate {
    func bankClerk(DidStartWork customerNumber: Int)
    func bankClerk(DidFinishWork customerNumber: Int)
}
