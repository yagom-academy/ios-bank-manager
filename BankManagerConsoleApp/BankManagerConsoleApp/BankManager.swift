struct BankManager {
    let bank: Bank
    
    init(_ bank: Bank) {
        self.bank = bank
    }
    
    func openUpBank() {
        print("1 : 은행개점 \n2 : 종료\n입력 :", terminator: " ")
        
        guard let status = readLine() else { return }
        
        selectWork(status)
    }

    private func selectWork(_ status: String) {
        switch status {
        case "1":
            startBanking()
            openUpBank()
        case "2":
            print("업무를 종료합니다.")
            return
        default:
            print("입력이 잘못되었습니다.")
            openUpBank()
        }
    }
    
    private func startBanking() {
        var customerNumber: Double = 0
        
        while !(bank.customer.isEmpty) {
            do {
                let customer = try bank.customer.dequeue()
                bank.banker[0].serve(customer: customer)
                customerNumber += 1
            } catch {
                print("응대할 고객이 없습니다.")
            }
    private func createCustomerQueue() -> Queue<Customer> {
        let customerQueue = Queue<Customer>()
        let numberOfCustomer = Int.random(in: 10...30)

        for number in 1...numberOfCustomer {
            let customer = Customer(number)
            customerQueue.enqueue(customer)
        }
        
        return customerQueue
    }

    private func createBanker(_ numberOfBanker: Int) -> [Banker] {
        var bankers = [Banker]()
        
        for _ in 1...numberOfBanker {
            let banker = Banker()
            bankers.append(banker)
        }
        
        return bankers
    }
}
