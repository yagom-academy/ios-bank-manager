//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Hyungmin Lee on 2023/07/12.
//

import Foundation

class Bank {
    let bankManagerCount: Int
    var clientQueue = Queue<Client>()
    let bankManger = BankManager()
    
    init(bankManagerCount: Int) {
        self.bankManagerCount = bankManagerCount
    }
    
    func open() {
        print("1 : 은행개점\n2 : 종료\n입력", terminator: " : ")
        let input = readLine()
        
        switch input {
        case "1":
            startTask()
        default:
            return
        }
    }
    
    private func startTask() {
        let group = DispatchGroup()
        let semaphore = DispatchSemaphore(value: bankManagerCount)
        
        setUpClientQueue()
        
        while !clientQueue.isEmpty {
            guard let client = clientQueue.dequeue() else { break }
            
            semaphore.wait()
            DispatchQueue.global().async(group: group) { [weak self] in
                self?.bankManger.work(client: client)
                semaphore.signal()
            }
        }
        group.wait()
        open()
    }
    
    private func setUpClientQueue() {
        let randomNumber = Int.random(in: 10...30)
        var client: Client
        
        for turn in 1...randomNumber {
            client = Client(turn)
            clientQueue.enqueue(client)
        }
    }
}
