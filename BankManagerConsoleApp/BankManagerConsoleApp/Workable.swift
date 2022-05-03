//
//  Workable.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

protocol Workable {
    var workType: WorkType { get }
    var clerksCountByWork: DispatchSemaphore { get }
    
    func deal(with client: Client?)
}
