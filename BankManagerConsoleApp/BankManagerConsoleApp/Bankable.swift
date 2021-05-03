//
//  Bankable.swift
//  BankManagerConsoleApp
//
//  Created by 윤재웅 on 2021/05/03.
//

import Foundation

protocol Bankable {
    var waitingNumber: Int { get set }
    var creditRate: creditRating { get set }
    var typeOfWork: workType { get set }
}
