//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/04/28.
//

import Foundation

struct BankClerk {
    private enum Constant {
        static let startWorkMessageFormat = "%d번 고객 %@업무 시작"
        static let finishedWorkMessageFormat = "%d번 고객 %@업무 완료"
    }
    let updateDispatchQueue = DispatchQueue(label: "update")

    func work(client: Client, completion: @escaping () -> Void) {
        print(String(format: Constant.startWorkMessageFormat, client.waitingNumber, client.taskType.text))
        let usecondsTimeForAClient = useconds_t(client.taskType.spendingTime * 1000000)
        usleep(usecondsTimeForAClient)
        print(String(format: Constant.finishedWorkMessageFormat, client.waitingNumber, client.taskType.text))
        updateDispatchQueue.async {
            completion()
        }
    }
}
