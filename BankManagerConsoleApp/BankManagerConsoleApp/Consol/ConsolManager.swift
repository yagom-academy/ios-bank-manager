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
        let workQueue = DispatchQueue(label: "work", attributes: .concurrent)
        let depositSemaphore = DispatchSemaphore(value: 2)
        let loanSemaphore = DispatchSemaphore(value: 1)
        let bank = Bank()
        let totalCustomer = bank.customerQueue.count

        while bank.customerQueue.isNotEmpty {
            do {
                let customer = try bank.popCustomer()
                if customer.business == "예금업무" {
                    workQueue.async(group: group) {
                        depositSemaphore.wait()
                        BankManager.work(customer: customer, time: 0.7)
                        depositSemaphore.signal()
                    }
                } else {
                    workQueue.async(group: group) {
                        loanSemaphore.wait()
                        BankManager.work(customer: customer, time: 1.1)
                        loanSemaphore.signal()
                    }
                }
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
