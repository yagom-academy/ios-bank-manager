import Foundation

struct Bank {
    private var customerQueue = CustomerQueue<Customer>(linkedList: LinkedList<Customer>())

    func execute(totalCustomerCount: Int, workTime: TimeInterval) {
    menuLoop:
        while true {
            printStartMessage()
            switch readLine() {
            case BankStatus.opening.menu :
                executeWork(totalCustomerCount, workTime)
            case BankStatus.closed.menu :
                break menuLoop
            default :
                print("잘못된 입력입니다.")
            }
        }
    }

    private func executeWork(_ totalCustomerCount: Int, _ workTime: TimeInterval) {
        var time = 0.0
        (0..<totalCustomerCount).forEach { number in
            do {
                customerQueue.enqueue(data: Customer(name: "\(number + 1)번"))
                let customer = try customerQueue.dequeue()
                BankManager.work(customer: customer, time: workTime)
                time += workTime
            } catch {
                return
            }
        }
        printCloseMessage(number: totalCustomerCount, time: time)
    }

    private func printCloseMessage(number: Int, time: Double) {
        let convertedTime = String(format: "%.2f", time)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(number)명이며, 총 업무시간은 \(convertedTime)초 입니다.")
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
