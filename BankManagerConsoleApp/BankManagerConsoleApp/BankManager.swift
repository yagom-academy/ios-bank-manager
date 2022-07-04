struct BankManager {
    private enum BankStatus: String {
        case open = "1"
        case close = "2"
    }
    
    func openUpBank() {
        print("1 : 은행개점 \n2 : 종료\n입력 :", terminator: " ")
        
        guard let status = readLine() else { return }
        
        guard let bankStatus = BankStatus(rawValue: status) else {
            print("입력이 잘못되었습니다.")
            openUpBank()
            return
        }
        
        selectWork(bankStatus)
    }

    private func selectWork(_ status: BankStatus) {
        let bank = Bank(banker: createBanker(1), customer: createCustomerQueue())
        switch status {
        case .open:
            bank.startBanking()
            openUpBank()
        case .close:
            print("업무를 종료합니다.")
            return
        }
    }
    
    private func createCustomerQueue() -> Queue<Customer> {
        let customerQueue = Queue<Customer>()
        let numberOfCustomer = Int.random(in: 10...30)
        
        (0..<numberOfCustomer).forEach {
            let customer = Customer($0 + 1)
            customerQueue.enqueue(customer)
        }
        
        return customerQueue
    }

    private func createBanker(_ numberOfBanker: Int) -> [Banker] {
        let array = Array(0..<numberOfBanker)
        
        let bankers = array.map { _ in
            return Banker()
        }
        
        return bankers
    }
}
