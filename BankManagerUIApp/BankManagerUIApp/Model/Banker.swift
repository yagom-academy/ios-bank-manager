import Foundation

protocol BankerDelegate: BankProtocol { }

final class Banker {
    weak var delegate: BankProtocol?
    
    func work(for customer: Customer) {
        let banking = customer.banking
        delegate?.banker(didStartWork: customer.waitingNumber)
        Thread.sleep(forTimeInterval: banking.speed)
        delegate?.banker(didFinishWork: customer.waitingNumber)
    }
}
