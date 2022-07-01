import Foundation

struct ConsolManager {
    func execute(during time: Double) {
    menuLoop:
        while true {
            printStartMessage()
            switch readLine() {
            case BankStatus.opening.menu :
                let bank = Bank()
                let totalCustomer = bank.executeWork(during: time)
                let totalTime = time * Double(totalCustomer)
                printCloseMessage(totalCustomer, totalTime)
            case BankStatus.closed.menu :
                break menuLoop
            default :
                print("잘못된 입력입니다.")
            }
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
