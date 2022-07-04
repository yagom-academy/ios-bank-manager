import Foundation

struct ConsolManager {
    func execute(during time: Double) {
    menuLoop:
        while true {
            printStartMessage()
            switch readLine() {
            case BankStatus.opening.menu :
                let totalCustomer = executeWork(during: time)
                let totalTime = time * Double(totalCustomer)
                printCloseMessage(totalCustomer, totalTime)
            case BankStatus.closed.menu :
                break menuLoop
            default :
                print("잘못된 입력입니다.")
            }
        }
    }

    func executeWork(during workTime: TimeInterval) -> Int {
        let bank = Bank()
        var totalCustomer = 0
        for _ in 0..<bank.customerQueue.count {
            do {
                let customer = try bank.popCustomer()
                print("\(customer.name) 고객 업무 시작")
                BankManager.work(during: workTime)
                print("\(customer.name) 고객 업무 완료")
                totalCustomer += 1
            } catch {
                print("고객이 없습니다.")
            }
        }
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
