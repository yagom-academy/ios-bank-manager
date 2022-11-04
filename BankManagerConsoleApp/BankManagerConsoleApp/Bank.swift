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
    let cumulativeClientCount: Int
    
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
            close()
        case "2":
            exit(0)
        default:
            print("올바른 메뉴 번호를 입력해주세요.")
        }
    }
    
    func close() {
        let time: Double = Double(cumulativeClientCount) * 0.7
        let message: String =
        String(format: "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 %d이며, 총 업무시간은 %.2f초 입니다.",
               cumulativeClientCount,
               time)
        
        print("\(message)")
    }
}
