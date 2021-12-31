import Foundation

protocol BankerDelegate: AnyObject {
    func banker(DidStartWork waitingNumber: Int)
    func banker(DidFinishWork waitingNumber: Int)
}

final class Banker {
    weak var delegate: BankerDelegate?
    
    func work(for customer: Customer) {
        let banking = customer.banking
        delegate?.banker(DidStartWork: customer.waitingNumber)
        Thread.sleep(forTimeInterval: banking.speed)
        delegate?.banker(DidFinishWork: customer.waitingNumber)
    }
}
