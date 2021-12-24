import Foundation

protocol BankManagerDelegate {
    func bankManagerDidReceiveInvalidInput()
    func bankManagerDidClose()
}
