//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 배은서 on 2021/04/30.
//

import Foundation

struct Client {
    private let task: BankTaskOperation
    
    enum Rating: String, CustomStringConvertible, CaseIterable {
        case vvip, vip, normal
            
        var description: String {
            switch self {
            case .vvip:
                return "VVIP"
            case .vip:
                return "VIP"
            case .normal:
                return "일반"
            }
        }
        
        var queuePriority: Operation.QueuePriority {
            switch self {
            case .vvip:
                return .veryHigh
            case .vip:
                return .high
            case .normal:
                return .normal
            }
        }
    }
    
    static func create(_ number: Int) throws -> Client {
        guard let rating = Rating.allCases.randomElement() else { throw BankError.invalidClientPriority }
        
        return Client(task: BankTaskOperation(number, rating.description, rating.queuePriority))
    }
    
    func getTask() -> BankTaskOperation {
        return task
    }
}
