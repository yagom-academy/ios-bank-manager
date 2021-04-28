////
////  BankManagerConsoleApp - main.swift
////  Created by yagom. 
////  Copyright © yagom academy. All rights reserved.
//// 
//
//import Foundation
//
////let queue = OperationQueue()
////queue.name = "custom Queue"
////queue.qualityOfService = .default
////
////let bankOperation = BlockOperation {
////    print("업무 시작")
////    Thread.sleep(forTimeInterval: 0.7)
////    print("업무 종료")
////}
////
////let bankOperation2 = BlockOperation {
////    print("업무 시작")
////    Thread.sleep(forTimeInterval: 0.7)
////    print("업무 종료")
////}
////
////queue.maxConcurrentOperationCount = 2
////
////queue.addOperation(bankOperation)
////queue.addOperation(bankOperation2)
//
//
//class Task: Operation {
//    var number: Int
//    
//    init (number: Int) {
//        self.number = number
//    }
//    
//    override func main() {
//        print(number, "번 고객 업무 시작")
//        Thread.sleep(forTimeInterval: 0.7)
//        print(number, "번 고객 업무 종료")
//    }
//}
//
//class Bank {
//    let queue = OperationQueue()
//    
//    func open() {
//        
//        queue.maxConcurrentOperationCount = 3
//        
//        while (true) {
//            print("1. 은행 개점")
//            print("2. 은행 종료")
//            print("입력: ", terminator: "")
//            let input = readLine()!
//            
//            switch input {
//            case "1":
//                handleCustomerTask()
//            case "2":
//                exit(1)
//            default:
//                print("다시 입력")
//            }
//        }
//    }
//    
//    func handleCustomerTask() {
//        // 랜덤으로 고객 수 만들기
//        let numberOfCustomer = 10
//        
//        // 고객 수 만큼 일을 만들기
//        let start = CFAbsoluteTimeGetCurrent()
//        print(start)
//        for i in 1...numberOfCustomer {
//            let task = Task(number: i)
//            queue.addOperation(task)
//            task.completionBlock = {
//                print(task.number, "done")
//            }
//        }
//        queue.waitUntilAllOperationsAreFinished()
//        let end = CFAbsoluteTimeGetCurrent()
//        print(end)
//        print("업무가 마갑되었습니다. 오늘 업무를 처리한 고객은 총", numberOfCustomer, "명이며 총 업무 시간은", (end-start).showUptoTwoDecimalPoint(), "초입니다")
//    }
//    
//    func close() {
//        
//    }
//    
//}
//
//extension Double {
//    func showUptoTwoDecimalPoint() -> String {
//        let numbarFormatter = NumberFormatter()
//        numbarFormatter.roundingMode = .floor
//        numbarFormatter.minimumSignificantDigits = 2
//        numbarFormatter.maximumSignificantDigits = 3
//        let result = numbarFormatter.string(for: self)
//        return result!
//    }
//}
//
//Bank().open()

Bank().open()
