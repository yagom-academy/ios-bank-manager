//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by ysp on 2021/04/27.
//

import Foundation

struct Banker {
    var identityNumber: Int
    private var counterNumber: Int

    func handleClientBussiness() {
        //print("\(totalNumberOfClinet) 고객 업무 시작")
        Bank.totalBusinessTime += 0.7
       // print("\(totalNumberOfClinet) 고객 업무 완료")
    }
}


