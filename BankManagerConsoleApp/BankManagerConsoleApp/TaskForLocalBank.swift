//
//  TaskForBank.swift
//  BankManagerConsoleApp
//
//  Created by Ryan-Son on 2021/05/06.
//

import Foundation

enum TaskForLocalBank {
    case deposit
    case loanDocumentsReview
    case loanExecution
    
    var processTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loanDocumentsReview, .loanExecution:
            return 0.3
        }
    }
}
