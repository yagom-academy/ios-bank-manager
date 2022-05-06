//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/04/28.
//

import Foundation

struct BankClerk {
    let updateDispatchQueue = DispatchQueue(label: "update")

    func work(client: Client, completion: @escaping () -> Void) {
        let usecondsTimeForAClient = useconds_t(client.taskType.spendingTime * 1000000)
        usleep(usecondsTimeForAClient)
        updateDispatchQueue.async {
            completion()
        }
    }
}
