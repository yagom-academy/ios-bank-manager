import Foundation

protocol BankerDelegate: AnyObject {
    func banker(didStartWork waitingNumber: Int)
    func banker(didFinishWork waitingNumber: Int)
}

final class Banker {
    weak var delegate: BankerDelegate?
    
    func work(for customer: Customer) {
        let banking = customer.banking
        delegate?.banker(didStartWork: customer.waitingNumber)
        Thread.sleep(forTimeInterval: banking.speed)
        delegate?.banker(didFinishWork: customer.waitingNumber)
    }
}
