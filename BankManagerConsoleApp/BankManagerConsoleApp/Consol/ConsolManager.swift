import Foundation

struct ConsolManager {
    func execute() {
    menuLoop:
        while true {
            printStartMessage()
            switch readLine() {
            case BankStatus.opening.menu :
                let startTime = CFAbsoluteTimeGetCurrent()
                let totalCustomer = executeWork()
                let totalTime = CFAbsoluteTimeGetCurrent() - startTime
                printCloseMessage(totalCustomer, totalTime)
            case BankStatus.closed.menu :
                break menuLoop
            default :
                print("잘못된 입력입니다.")
            }
        }
    }

    func executeWork() -> Int {
        let group = DispatchGroup()
        let depositQueue = DispatchQueue(label: "deposit", attributes: .concurrent)
        let loanQueue = DispatchQueue(label: "loan", attributes: .concurrent)
        let bank = Bank()
        var totalCustomer = 0
        let semaphore1 = DispatchSemaphore(value: 2)
        let semaphore = DispatchSemaphore(value: 1)
        
        while !bank.customerQueue.isEmpty {
            do {
                let customer = try bank.popCustomer()
                if customer.business == "예금업무" {
                    depositQueue.async(group: group) {
                        semaphore1.wait()
                        print("\(customer.name) 고객 \(customer.business) 시작")
                        Thread.sleep(forTimeInterval: 0.7)
                        print("\(customer.name) 고객 \(customer.business) 완료")
                        semaphore1.signal()
                    }
                } else {
                    loanQueue.async(group: group) {
                        semaphore.wait()
                        print("\(customer.name) 고객 \(customer.business) 시작")
                        Thread.sleep(forTimeInterval: 1.1)
                        print("\(customer.name) 고객 \(customer.business) 완료")
                        semaphore.signal()
                    }
                }
                totalCustomer += 1
            } catch {
                print("고객이 없습니다.")
            }
        }
        group.wait()

        return totalCustomer
    }

    private func printCloseMessage(_ totalCustomer: Int, _ time: Double) {
        let convertedTime = String(format: "%.2f", time)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(convertedTime)초 입니다.")
    }

    private func printStartMessage() {
        print(
        """
        \(BankStatus.opening.menu) : 은행개점
        \(BankStatus.closed.menu) : 종료
        입력 :
        """, terminator: " ")
    }
}
