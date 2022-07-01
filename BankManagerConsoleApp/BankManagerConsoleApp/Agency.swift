//
//  Agency.swift
//  BankManagerConsoleApp
//
//  Created by 김동용 on 2022/07/01.
//

protocol Agency {
    associatedtype T: Equatable
    
    var customerQueue: Queue<T> { get set }
    
    mutating func generateEmployee(numberOfBankers: Int)
    mutating func openAgency()
    mutating func closeAgency()
}
