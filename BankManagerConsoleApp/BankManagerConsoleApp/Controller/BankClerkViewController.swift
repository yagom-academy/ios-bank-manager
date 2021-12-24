import Foundation

class BankClerkViewController {
    private var bankClerk: BankClerk
    
    init(bankClerk: BankClerk) {
        self.bankClerk = bankClerk
        self.bankClerk.delegate = self
    }
    
    private func showCustomerStart(for customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
    }
    
    private func showCustomerEnd(for customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 완료")
    }
}

extension BankClerkViewController: BankClerkDelegate {
    func bankClerk(DidStartWork customerNumber: Int) {
        showCustomerStart(for: customerNumber)
    }
    
    func bankClerk(DidFinishWork customerNumber: Int) {
        showCustomerEnd(for: customerNumber)
    }
}

