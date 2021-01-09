
import Foundation

class Bank {
    private var bankClerkNumber: Int
    private var waitingList: [Client] = []
    private var totalVistedClientsNumber: Int = 0
    
    var endingMent: String {
        return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 명이며, 총 업무시간은 초입니다."
    }
    
    init(employeeNumber: Int) {
        self.bankClerkNumber = employeeNumber
    }

    func updateWaitingList(of size: Int) throws {
        guard size > 0 else {
            throw BankOperationError.invalidValue
        }

        for _ in  1...size {
            self.totalVistedClientsNumber += 1
            let newClient = Client(waitingNumber: totalVistedClientsNumber, business: .deposit, grade: .VIP)
            waitingList.append(newClient)
        }
    }
    
//    @objc private func assignClient(_ noti: Notification) {
//        guard let client = waitingList.first, let counterNumber = noti.userInfo?["counterNumber"] as? Int else {
//            return
//        }
//
//        waitingList.removeFirst()
//
//        guard let workableBankClerk = serviceCounter[counterNumber] else {
//            return
//        }
//
//        workableBankClerk.handleClientBusiness(of: client)
//    }
}

