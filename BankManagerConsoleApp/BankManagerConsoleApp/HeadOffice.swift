import Foundation

class HeadOffice {
    static let main = HeadOffice()
    
    let examineLoanQueue = DispatchQueue(label: "examineLoanQueue")
    
    private init() {}
    
    func examineLoan(_ customer: Customer) {
        self.examineLoanQueue.sync {
            print("\(customer.waiting)번 본사 대출서류 심사")
            Thread.sleep(forTimeInterval: 0.5)
        }
    }
}
