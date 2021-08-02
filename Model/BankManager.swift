//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var queuesByTask: Dictionary<Task, (Task, Array<BankTeller>, Queue<Client>)> = [:]
    
    init(_ clientQueues: Dictionary<Task, Queue<Client>>) {
        Task.allCases.forEach { (task) in
            let bankTellers = Array<BankTeller>(repeating: BankTeller(task: task), count: task.windowCount)
            let clients = clientQueues[task] ?? Queue<Client>()
            queuesByTask.updateValue((task, bankTellers, clients), forKey: task)
        }
    }
    
    func open(_ completion: @escaping (Int, Double) -> Void) {
        var clientCount: Int = 0
        var totalTime: Double = 0
        
        let queueGroup = DispatchGroup()
        for task in Task.allCases {
            queueGroup.enter()
            DispatchQueue.init(label: "serial.queue.\(task)").async(group: queueGroup) {
                let bankTellers = queuesByTask[task]?.1 ?? Array<BankTeller>(repeating: BankTeller(task: task), count: task.windowCount)
                let clients = queuesByTask[task]?.2 ?? Queue<Client>()
                dequeueClient(task, bankTellers, clients) {
                    
                }
            }
            queueGroup.leave()
        }
        queueGroup.wait()
        completion(clientCount, totalTime)
    }
    
    private func dequeueClient(_ task: Task, _ bankTellers: Array<BankTeller>, _ clients: Queue<Client>, _ completion: () -> Void) {
        var bankTellers = bankTellers, clients = clients
        let semaphore = DispatchSemaphore(value: task.windowCount)
//        let taskGroup = DispatchGroup()
        while let task = clients.dequeue() {
            semaphore.wait()
            guard let bankTeller = bankTellers.popLast() else {
                continue
            }
//            taskGroup.enter()
            DispatchQueue.init(label: "\(task)", attributes: .concurrent).async {
                bankTeller.serve(task)
                bankTellers.append(bankTeller) // insert(0, bankTeller)
                semaphore.signal()
//                taskGroup.leave()
            }
        }
//        taskGroup.wait()
    }
}
