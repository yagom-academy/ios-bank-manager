//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

final class BankClerk: Operation, Workable {
    private enum Message {
        static let start = "%d번 고객 %@업무 시작"
        static let end = "%d번 고객 %@업무 종료"
    }
    
    private(set) var clientQueue: Queue<LinkedList<Client>>
    private(set) var workType: WorkType
    
    init(workType: WorkType, queue: Queue<LinkedList<Client>>) {
        self.workType = workType
        self.clientQueue = queue
    }
    
    override func main() {
        serveClient()
    }
    
    private func serveClient() {
        while let client = clientQueue.dequeue() {
            deal(with: client)
        }
    }
    
    private func deal(with client: Client) {
        let workStartingMessage = String(format: Message.start,
                                         client.orderNumber,
                                         workType.description)
        let workEndingMessage = String(format: Message.end,
                                       client.orderNumber,
                                       workType.description)
        
        print(workStartingMessage)
        Thread.sleep(forTimeInterval: workType.takenTime)
        print(workEndingMessage)
    }
}
