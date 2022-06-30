func createCustomerQueue() -> Queue<Customer> {
    let customerQueue = Queue<Customer>()
    let numberOfCustomer = Int.random(in: 10...30)

    for number in 1...numberOfCustomer {
        let customer = Customer(number)
        customerQueue.enqueue(customer)
    }
    
    return customerQueue
}

func createBanker(_ numberOfBanker: Int) -> [Banker] {
    var bankers = [Banker]()
    
    for _ in 1...numberOfBanker {
        let banker = Banker()
        bankers.append(banker)
    }
    
    return bankers
}

let bank = Bank(banker: createBanker(1),
                customer: createCustomerQueue())

let bankManager = BankManager(bank)

bankManager.openUpBank()
