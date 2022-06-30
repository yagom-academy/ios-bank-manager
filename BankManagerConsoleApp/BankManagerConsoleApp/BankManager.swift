struct BankManager {
    private let bank = Bank(customer: createCustomerQueue())
    
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
                bank.banker.serve(customer: customer)
                customerNumber += 1
            } catch {
                print("응대할 고객이 없습니다.")
            }
        }
        
        let workingTime = String(format: "%.2f", customerNumber * 0.7)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(Int(customerNumber))명이며, 총 업무시간은 \(workingTime)초입니다.")
    }
}
