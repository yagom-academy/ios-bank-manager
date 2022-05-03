//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

struct BankClerk: Workable {
    private enum Message {
        static let start = "%d번 고객 %@업무 시작"
        static let end = "%d번 고객 %@업무 종료"
    }

    private enum Constant {
        static let loanWorkTime = 1.1
        static let depositWorkTime = 0.7
    }
    
    private(set) var workType: WorkType
    private(set) var clerksCountByWork: DispatchSemaphore
    
    init(workType: WorkType, clerkCount: Int) {
        self.workType = workType
        self.clerksCountByWork = DispatchSemaphore(value: clerkCount)
    }
    
    func deal(with client: Client?) {
        self.clerksCountByWork.wait()
        
        guard let client = client else {
            return
        }
        
        let workTime = workType == .loan ? Constant.loanWorkTime : Constant.depositWorkTime
        let workStartingMessage = String(format: Message.start,
                                         client.orderNumber,
                                         workType.description)
        let workEndingMessage = String(format: Message.end,
                                       client.orderNumber,
                                       workType.description)
        
        print(workStartingMessage)
        Thread.sleep(forTimeInterval: workTime)
        print(workEndingMessage)
        
        self.clerksCountByWork.signal()
    }
}
