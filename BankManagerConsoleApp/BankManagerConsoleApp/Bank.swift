struct Bank {
    private let banker: [Banker]
    private let customer: Queue<Customer>
    
    init(banker: [Banker], customer: Queue<Customer>) {
        self.banker = banker
        self.customer = customer
    }
    
    func startBanking() {
        var customerNumber: Double = 0
        
        while customer.isEmpty == false {
            guard let customer = customer.dequeue() else { return }
            banker[0].serve(customer: customer)
            customerNumber += 1
        }
        
        let workingTime = String(format: "%.2f", customerNumber * 0.7)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(Int(customerNumber))명이며, 총 업무시간은 \(workingTime)초입니다.")
    }
}
