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
        case vvip = "VVIP"
        case vip = "VIP"
        case normal = "일반"
            
        var description: String {
            return "\(self.rawValue)"
        }
    }
    
    static func create() throws -> [Client] {
        var clients: [Client] = []
        
        for number in 1...Int.random(in: 10...30) {
            guard let priority = Rating.allCases.randomElement() else { throw BankError.invalidClientPriority }
            clients.append(Client(task: BankTaskOperation(number, priority)))
        }
        
        return clients
    }
    
    func getTask() -> BankTaskOperation {
        return task
    }
}
