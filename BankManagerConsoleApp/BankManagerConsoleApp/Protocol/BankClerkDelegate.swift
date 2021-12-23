import Foundation

protocol BankClerkDelegate: AnyObject {
    func bankClerk(DidStartWork customerNumber: Int)
    func bankClerk(DidFinishWork customerNumber: Int)
}
