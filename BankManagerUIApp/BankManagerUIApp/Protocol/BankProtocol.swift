import Foundation

protocol BankProtocol: AnyObject {
    func bank(didEnqueueCustomer customer: Customer)
    func bank(didChangeWorkTime workTime: Double)
    func banker(didStartWork waitingNumber: Int)
    func banker(didFinishWork waitingNumber: Int)
}
