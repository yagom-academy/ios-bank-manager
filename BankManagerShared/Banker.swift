import Foundation

struct Banker {
    var delegate: BankDelegate?
    var customer: Customer? {
        didSet {
            task()
        }
    }
    
    init() {}
    
    private func task() {
        do {
            try taskWithError()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func taskWithError() throws {
        guard let customer = customer else {
            throw CustomerError.notExistCustomer
        }

        print("\(customer.customerNumber)번 고객 업무 시작")
        delegate?.checkTime()
        print("\(customer.customerNumber)번 고객 업무 완료")
        delegate?.checkCustomer()
    }
}
