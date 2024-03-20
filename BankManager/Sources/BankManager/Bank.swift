//
//  File.swift
//  
//
//  Created by Diana, Hamzzi on 3/20/24.
//

import Foundation

struct Bank {
    var workerList = Queue<Int>()
    
    mutating func createWorker() {
        if workerList.isEmpty {
            workerList.enqueue(1)
        } else {
            // error
        }
    }
    
    // 은행원 은행창구에 각각 지정
    func designateWorker() {
        // 세마포어 시, 필요
    }
    // queue 가 비어있는지 확인한다.
    // queue 에 고객을 담는다
}
