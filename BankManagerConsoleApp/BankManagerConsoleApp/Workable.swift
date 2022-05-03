//
//  Workable.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

protocol Workable {
    var workType: WorkType { get }
    var semaphore: DispatchSemaphore { get }
    
    func deal(with client: Client?)
}
