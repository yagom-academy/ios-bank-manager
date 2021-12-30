import Foundation

enum Menu {
    static let bankOpen = "1"
    static let exit = "2"
}

class BankManager {
    private var bank = Bank()
    
    init() {
        bank.delegate = self
    }
    
    private func showMenu() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ",terminator: "")
    }
    
    func selectMenu() -> String? {
        showMenu()
        let selectedMenu = readLine()
        
        return selectedMenu
    }
    
    func openBank() {
        let numberOfCustomer = generateNumberOfCustomer()
        bank.setWaitingLine(with: numberOfCustomer)
        bank.start()
    }
    
    func exit() {
        return 
    }
    
    private func generateNumberOfCustomer() -> Int {
        let range: ClosedRange<Int> = 10...30
        let numberOfCustomer = Int.random(in: range)
        
        return numberOfCustomer
    }
}

extension BankManager: BankDelegate {
    func didFinishWork(totalCustomer: Int, workingTime: Double) {
        let totalTime = String(format: "%.2f", workingTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(totalTime)초입니다.")
    }
}
