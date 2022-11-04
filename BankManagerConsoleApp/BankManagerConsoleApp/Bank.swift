//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/03.
//
import Foundation

struct Bank {
    let bankWorker: BankWorker
    let numberTicketQueue: Queue<Client>
    
    func returnTicketNumber() -> Int {
        return numberTicketQueue.linkedList.count
    }
    
    func updateClientList(_ client: Client) {
        numberTicketQueue.enqueue(client)
    }
    
    func directBankWorker() {
        while !numberTicketQueue.isEmpty {
            guard let client = numberTicketQueue.dequeue() else {
                return
            }
            
            bankWorker.startWork(client: client)
        }
    }
    
    func open() {
        print("""
            1. 은행개점
            2. 종료
            입력
            """, terminator: " ")
        
        let menuNumber: String?  = readLine()
        
        switch menuNumber {
        case "1":
            directBankWorker()
            return
        case "2":
            exit(0)
        default:
            print("올바른 메뉴 번호를 입력해주세요.")
        }
    }
}
