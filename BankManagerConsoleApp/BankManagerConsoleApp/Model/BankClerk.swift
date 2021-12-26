import Foundation

final class BankClerk {
    private let workSpeed: TimeInterval
    var delegate: BankClerkDelegate?
    
    init(workSpeed: TimeInterval = 0.7) {
        self.workSpeed = workSpeed
    }
    
    func work(for customer: Customer) {
        delegate?.bankClerk(didStartWork: customer.waitingNumber)
        Thread.sleep(forTimeInterval: workSpeed)
        delegate?.bankClerk(didFinishWork: customer.waitingNumber)
    }
}
