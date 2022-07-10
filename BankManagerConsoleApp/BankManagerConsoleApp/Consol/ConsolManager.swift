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

    private func executeWork() -> Int {
        let workQueue = OperationQueue()
        let deposit = DispatchSemaphore(value: 2)
        let loan = DispatchSemaphore(value: 1)
        let bank = Bank()
        let totalCustomer = bank.customerQueue.count

        while bank.customerQueue.isNotEmpty {
            let customer: Customer
            do {
                customer = try bank.popCustomer()
            } catch {
                print("고객이 없습니다.")
                break
            }
            if customer.business == .deposit {
                workBanking(business: deposit, for: customer, workQueue: workQueue)
            } else {
                workBanking(business: loan, for: customer, workQueue: workQueue)
            }
        }

        workQueue.waitUntilAllOperationsAreFinished()
        return totalCustomer
    }

    private func workBanking(business semaphore: DispatchSemaphore,
                             for customer: Customer,
                             workQueue: OperationQueue) {
        let time = customer.business == .deposit ?
        BankBusiness.deposit.processingTime : BankBusiness.loan.processingTime

        workQueue.addOperation {
            semaphore.wait()
            //BankManager.work(customer: customer, time: time)
            semaphore.signal()
            }
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
