import Foundation

protocol BankDelegate {
    func bank(didFinish numberOfCustomers: Int, durationTime: String)
}
