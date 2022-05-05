//
//  Workable.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

protocol Workable: Operation {
    var clientQueue: Queue<LinkedList<Client>> { get }
    var workType: WorkType { get }
}
