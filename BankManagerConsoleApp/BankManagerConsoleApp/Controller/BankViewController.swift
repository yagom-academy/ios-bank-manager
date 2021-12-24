import Foundation

class BankViewController {
    private var bank: Bank
    
    init(bank: Bank) {
        self.bank = bank
        self.bank.delegate = self
    }
    
    private func showEndBankWork(numberOfCustomers: Int, durationTime: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomers)명이며, 총 업무시간은 \(durationTime)초 입니다.")
    }
}

extension BankViewController: BankDelegate {
    func bank(didFinish numberOfCustomers: Int, durationTime: String) {
        showEndBankWork(numberOfCustomers: numberOfCustomers, durationTime: durationTime)
    }
}
