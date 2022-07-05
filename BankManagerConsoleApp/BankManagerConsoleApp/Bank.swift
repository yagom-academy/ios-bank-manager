struct Bank {
    func startBanking(customer: Queue<Customer>, bankers: [BankerLogic]) -> Double {
        var customerNumber: Double = 0
        
        while customer.isEmpty == false {
            guard let customer = customer.dequeue() else { return 0 }
            bankers[0].serve(customer: customer)
            customerNumber += 1
        }
        
        return customerNumber
    }
}
