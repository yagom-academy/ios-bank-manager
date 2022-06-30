func createCustomerQueue() -> Queue<Customer> {
    let customerQueue = Queue<Customer>()
    let numberOfCustomer = Int.random(in: 10...30)

    for number in 1...numberOfCustomer {
        let customer = Customer(number)
        customerQueue.enqueue(customer)
    }
    
    return customerQueue
}

let bankManager = BankManager()

bankManager.openUpBank()
